# frozen_string_literal: true

##
class GenerateReturnsJob < ActiveJob::Base
  queue_as :default

  def perform(accountable_type)
    if accountable_type == 'FedexAccount'
      fedex_accounts_returns
    elsif accountable_type == 'EasyPostAccount'
      easy_post_accounts_returns
    end
  end

  def fedex_accounts_returns
    require 'savon'

    rental_returns = RentalReturn.where(submitted: false, accountable_type: 'FedexAccount')
    rental_returns.each do |rental_return|
      client = Savon.client(wsdl: Rails.root + 'app/jobs/OpenshipService_v17.wsdl',
                            env_namespace: 'SOAP-ENV',
                            namespace_identifier: :ns1,
                            convert_request_keys_to: :none,
                            endpoint: rental_return.accountable.prod ? 'https://ws.fedex.com:443/web-services/openship' : 'https://wsbeta.fedex.com:443/web-services/openship')

      message = rental_return.return_label_message

      response = client.call(:create_pending_shipment, message: message)

      rental_return.update(response: response.body, submitted: response.body[:create_pending_shipment_reply][:highest_severity] == 'SUCCESS')
    end
  end

  def easy_post_accounts_returns
    rental_returns = RentalReturn.where(submitted: false, accountable_type: 'EasyPostAccount')
    rental_returns.each do |rental_return|
      service = EasyPostService.new(rental_return)
      label_url = service.generate_label_url
      if label_url.present?
        rental_return.update(
          label_url: label_url,
          submitted: true
        )
        EasyPostMailer.email_label_url(rental_return).deliver_later
      end
    end
  end
end
