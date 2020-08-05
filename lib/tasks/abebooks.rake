# frozen_string_literal: true

namespace :abebooks do
  desc 'Temp way to get abebooks data job'
  task :perform, [:client_key] => :environment do |_t, args|
    puts "performing abebooks rake task for client key #{args[:client_key]}============"
    Book.all.each do |book|
      uri = "http://search2.abebooks.com/search?clientkey=#{args[:client_key]}&isbn=#{book.ean}&minsellerrating=4&pt=book"
      response = HTTP.get(URI.parse(uri))
      data = Hash.from_xml(response)
      search_Result = data['searchResults']
      next unless search_Result.present?
      books = search_Result['Book']
      next unless books.present?
      vendor_ids = books.map { |r_book| r_book['vendorId'] }.uniq
      next unless vendor_ids.present?
      vendor_ids.each do |vendorId|
        puts "started to get abebooks data for vendor_id #{vendorId}"
        data_query = "SELECT COUNT(*) FROM abebooks_temp WHERE vendor_id = '#{vendorId}'"
        total_records = ActiveRecord::Base.connection.exec_query(data_query).rows.flatten.first.to_i
        puts "total records for vendor_id #{vendorId} is #{total_records}"
        next if total_records > 0
        puts 'calling abebooks api to get vendor result for all books'
        uri = "http://search2.abebooks.com/search?clientkey=#{args[:client_key]}&minsellerrating=4&pt=book&vendorlocation=US&vendorid=#{vendorId}&maxresults=200"
        s = HTTP.get(URI.parse(uri))
        details = Hash.from_xml(s)
        search_Result = details['searchResults']
        next unless search_Result.present?
        books = search_Result['Book']
        next unless books.present?
        quantity = books.map { |r_book| r_book['quantity'].to_i }.reduce(0, :+)
        vendorName = books.last['vendorName'].delete("'")
        puts "***** calculated_quantity and vendorId #{quantity} ---- #{vendorId} *****"
        query = "INSERT INTO abebooks_temp (vendor_id, vendor_name, quantity, ean) VALUES ('#{vendorId}', '#{vendorName}', #{quantity}, #{book.ean})"
        ActiveRecord::Base.connection.execute(query)
        puts "****** ended execution for the vendorId #{vendorId} *****"
        puts ''
      end
    end
    puts 'completed abbooks rake task ============'
  end
end
