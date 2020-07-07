# frozen_string_literal: true

namespace :abebooks do
  desc 'Temp way to run generate_returns job'
  task perform: :environment do
    isbns.each do |ean|
      uri = "http://search2.abebooks.com/search?clientkey=f3bd4168-61f8-4e83-b9a3-f8f6e79bba3c&isbn=#{ean}&minsellerrating=4&pt=book"
      response = HTTP.get(URI.parse(uri))
      data = Hash.from_xml(response)
      search_Result = data['searchResults']
      next unless search_Result.present?
      books = search_Result['Book']
      next unless books.present?
      vendor_ids = books.map { |book| book['vendorId'].to_i }.uniq
      next unless vendor_ids.present?
      vendor_ids.each do |vendorId|
        uri = "http://search2.abebooks.com/search?clientkey=f3bd4168-61f8-4e83-b9a3-f8f6e79bba3c&vendorid=#{vendorId}&minsellerrating=4&pt=book&vendorlocation=US"
        s = HTTP.get(URI.parse(uri))
        details = Hash.from_xml(s)
        search_Result = details['searchResults']
        next unless search_Result.present?
        books = search_Result['Book']
        next unless books.present?
        quantity = books.map { |book| book['quantity'].to_i }.reduce(0, :+)
        vendorName = books.last['vendorName']
        puts "***** calculated_quantity and vendorId #{quantity} ---- #{vendorId} *****"
        query = "INSERT INTO abebooks_temp (vendor_id, vendor_name, quantity, ean) VALUES (#{vendorId}, '#{vendorName}', #{quantity}, #{ean})"
        ActiveRecord::Base.connection.execute(query)
      end
    end
  end
end

def isbns
  Book.all.map(&:ean)
end
