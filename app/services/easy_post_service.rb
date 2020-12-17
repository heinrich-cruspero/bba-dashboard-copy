# frozen_string_literal: true

require 'easypost'

##
class EasyPostService
  def initialize(rental_return)
    @rental_return = rental_return
    @easy_post_account = rental_return.accountable
  end

  def generate_label_url
    EasyPost.api_key = @easy_post_account.key
    to_address = EasyPost::Address.create(
      name: @rental_return.name,
      street1: @rental_return.street,
      city: @rental_return.city,
      state: @rental_return.state,
      zip: @rental_return.zip_code,
      phone: @rental_return.phone_number
    )
    from_address = EasyPost::Address.create(
      company: @easy_post_account.company_name,
      street1: @easy_post_account.street,
      street2: @easy_post_account.street,
      city: @easy_post_account.city,
      state: @easy_post_account.state,
      zip: @easy_post_account.zip_code,
      phone: @easy_post_account.phone_number
    )
    parcel = EasyPost::Parcel.create(
      width: @easy_post_account.parcel_width,
      length: @easy_post_account.parcel_length,
      height: @easy_post_account.parcel_height,
      weight: @easy_post_account.parcel_weight
    )
    shipment = EasyPost::Shipment.create(
      to_address: to_address,
      from_address: from_address,
      parcel: parcel,
      is_return: true
    )
    shipment.buy(
      rate: shipment.lowest_rate
    )

    shipment.postage_label.label_url
  end
end
