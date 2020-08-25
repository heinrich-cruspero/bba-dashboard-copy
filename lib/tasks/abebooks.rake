# frozen_string_literal: true

namespace :abebooks do
  desc 'Temp way to get abebooks data job'
  task :perform, [:client_key] => :environment do |_t, args|
    puts "performing abebooks rake task for client key #{args[:client_key]}============"

    @client_key = args[:client_key]

    #create_tables
    vendors
    vendor_books

    puts 'completed abbooks rake task ============'
  end

  def create_tables
    puts 'Dropping & Creating tmp_abe_books_vendors, tmp_abe_books_vendor_books tables'

    ActiveRecord::Base.connection.execute('drop table if exists tmp_abe_books_vendors, tmp_abe_books_vendor_books;')

    ActiveRecord::Base.connection.execute('create table tmp_abe_books_vendors
          (
              id bigserial not null constraint tmp_abe_books_vendors_pkey primary key,
              vendor_id   varchar(255) not null,
              vendor_name varchar(255)
          );')

    ActiveRecord::Base.connection.execute('create unique index tmp_abe_books_vendors_vendor_id_uindex
              on tmp_abe_books_vendors (vendor_id);')

    ActiveRecord::Base.connection.execute('create index tmp_abe_books_vendors_vendor_id_vendor_name_index
              on tmp_abe_books_vendors (vendor_id, vendor_name);')

    ActiveRecord::Base.connection.execute('create index tmp_abe_books_vendors_vendor_name_index
              on tmp_abe_books_vendors (vendor_name);')

    ActiveRecord::Base.connection.execute('create table tmp_abe_books_vendor_books
          (
              vendor_id   integer constraint tmp_abe_books_vendor_books_tmp_abe_books_vendors_id_fk references tmp_abe_books_vendors,
              ean         varchar(13) not null,
              quantity    bigint
          );')

    ActiveRecord::Base.connection.execute('create index tmp_abe_books_vendor_books_ean_index
              on tmp_abe_books_vendor_books (ean);')

    ActiveRecord::Base.connection.execute('create unique index tmp_abe_books_vendor_books_vendor_id_ean_index
              on tmp_abe_books_vendor_books (vendor_id, ean);')
  end

  def vendors
    puts 'Getting vendors for all records in the books table'

    Book.order(:id).find_each do |book|
      puts "Book #{book.id}"
      uri = "http://search2.abebooks.com/search?clientkey=#{@client_key}&isbn=#{book.ean}&minsellerrating=4&pt=book"
      response = HTTP.get(URI.parse(uri))
      response_hash = Hash.from_xml(response)
      next if response_hash.nil?
      search_result = response_hash['searchResults']
      next unless search_result.present?
      book_results = search_result['Book']
      next unless book_results.present?
      if book_results.class == Hash
        ActiveRecord::Base.connection.execute("INSERT INTO tmp_abe_books_vendors (vendor_id, vendor_name) VALUES (#{ActiveRecord::Base.connection.quote(book_results['vendorId'])}, #{ActiveRecord::Base.connection.quote(book_results['vendorName'])}) ON CONFLICT DO NOTHING")
      else
        book_results.each do |book_result|
          ActiveRecord::Base.connection.execute("INSERT INTO tmp_abe_books_vendors (vendor_id, vendor_name) VALUES (#{ActiveRecord::Base.connection.quote(book_result['vendorId'])}, #{ActiveRecord::Base.connection.quote(book_result['vendorName'])}) ON CONFLICT DO NOTHING")
        end
      end
    end
  end

  def vendor_books
    puts 'Getting vendor book quantity for all records in the vendors table'

    vendors = ActiveRecord::Base.connection.execute('select * from tmp_abe_books_vendors order by id')
    vendors.each do |vendor|
      puts "Vendor #{vendor}"

      uri = "http://search2.abebooks.com/search?clientkey=#{@client_key}&minsellerrating=4&pt=book&vendorlocation=US&vendorid=#{vendor['vendor_id']}&maxresults=200"
      response = HTTP.get(URI.parse(uri))
      response_hash = Hash.from_xml(response)
      next if response_hash.nil?
      search_result = response_hash['searchResults']
      next unless search_result.present?
      books = search_result['Book']
      next unless books.present?

      if books.class == Hash
        next if book['isbn13'].nil?
        ActiveRecord::Base.connection.execute("INSERT INTO tmp_abe_books_vendor_books (vendor_id, ean, quantity) VALUES (#{vendor['id']}, #{ActiveRecord::Base.connection.quote(book['isbn13'])}, #{book['quantity']}) ON CONFLICT (vendor_id, ean) DO UPDATE set quantity = ((select quantity from tmp_abe_books_vendor_books where vendor_id = #{vendor['id']} and ean = #{ActiveRecord::Base.connection.quote(book['isbn13'])}) + #{book['quantity']})")
      else
        books.each do |book|
          next if book['isbn13'].nil?
          ActiveRecord::Base.connection.execute("INSERT INTO tmp_abe_books_vendor_books (vendor_id, ean, quantity) VALUES (#{vendor['id']}, #{ActiveRecord::Base.connection.quote(book['isbn13'])}, #{book['quantity']}) ON CONFLICT (vendor_id, ean) DO UPDATE set quantity = ((select quantity from tmp_abe_books_vendor_books where vendor_id = #{vendor['id']} and ean = #{ActiveRecord::Base.connection.quote(book['isbn13'])}) + #{book['quantity']})")
        end
      end
    end
  end
end
