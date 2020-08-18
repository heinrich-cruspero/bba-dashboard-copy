# frozen_string_literal: true

namespace :abebooks do
  desc 'Temp way to get abebooks data job'
  task :perform, [:client_key] => :environment do |_t, args|
    puts "performing abebooks rake task for client key #{args[:client_key]}============"
    Book.all.each do |book|
      uri = "http://search2.abebooks.com/search?clientkey=#{args[:client_key]}&isbn=#{book.ean}&minsellerrating=4&pt=book"
      response = HTTP.get(URI.parse(uri))
      data = Hash.from_xml(response)
      search_result = data['searchResults']
      next unless search_result.present?
      books = search_result['Book']
      next unless books.present?
      vendor_ids = books.map { |r_book| r_book['vendorId'] }.uniq
      next unless vendor_ids.present?
      vendor_ids.each do |vendor_id|
        puts "started to get abebooks data for vendor_id #{vendor_id}"
        data_query = "SELECT COUNT(*) FROM abebooks_temp WHERE vendor_id = '#{vendor_id}'"
        total_records = ActiveRecord::Base.connection.exec_query(data_query).rows.flatten.first.to_i
        puts "total records for vendor_id #{vendor_id} is #{total_records}"
        next if total_records.positive?
        puts 'calling abebooks api to get vendor result for all books'
        uri = "http://search2.abebooks.com/search?clientkey=#{args[:client_key]}&minsellerrating=4&pt=book&vendorlocation=US&vendorid=#{vendor_id}&maxresults=200"
        s = HTTP.get(URI.parse(uri))
        details = Hash.from_xml(s)
        search_result = details['searchResults']
        next unless search_result.present?
        books = search_result['Book']
        next unless books.present?
        quantity = books.map { |r_book| r_book['quantity'].to_i }.reduce(0, :+)
        vendor_name = books.last['vendor_name'].delete("'")
        puts "***** calculated_quantity and vendor_id #{quantity} ---- #{vendor_id} *****"
        query = "INSERT INTO abebooks_temp (vendor_id, vendor_name, quantity, ean) VALUES ('#{vendor_id}', '#{vendor_name}', #{quantity}, #{book.ean})"
        ActiveRecord::Base.connection.execute(query)
        puts "****** ended execution for the vendor_id #{vendor_id} *****"
        puts ''
      end
    end
    puts 'completed abbooks rake task ============'
  end
end
