# frozen_string_literal: true

##
class GenerateReturnsJob < ActiveJob::Base
  queue_as :default

  def perform
    require 'savon'

    rental_returns = RentalReturn.where(submitted: false)
    rental_returns.each do |rental_return|
      client = Savon.client(wsdl: Rails.root + 'app/jobs/OpenshipService_v17.wsdl',
                            env_namespace: 'SOAP-ENV',
                            namespace_identifier: :ns1,
                            convert_request_keys_to: :none,
                            endpoint: rental_return.fedex_account.prod ? 'https://ws.fedex.com:443/web-services/openship' : 'https://wsbeta.fedex.com:443/web-services/openship')

      message = rental_return.return_label_message

      response = client.call(:create_pending_shipment, message: message)

      rental_return.update(response: response.body, submitted: response.body[:create_pending_shipment_reply][:highest_severity] == 'SUCCESS')
    end
  end
end
