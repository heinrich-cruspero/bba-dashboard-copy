# frozen_string_literal: true

##
class DataWhApiService
  def initialize
    @url = ENV['DATA_WH_URL']
    @access_token = ENV['DATA_WH_TOKEN']
  end

  def get_book(field, val)
    uri = URI.parse("#{@url}/api/v1/products?#{field}=#{val}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    request.add_field('Authorization', "Token token=#{@access_token}")
    response = http.request(request)
    JSON.parse(response.body)
  end
end
