# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EasyPostAccount, type: :model do
  it 'is valid with valid attributes' do
    expect(EasyPostAccount.new(key: Faker::Lorem.characters(10),
                               account_number: Faker::Number.number(10),
                               name: Faker::Name.name,
                               company_name: Faker::Company.name,
                               phone_number: Faker::PhoneNumber.phone_number,
                               street: Faker::Address.street_address,
                               city: Faker::Address.city,
                               state: Faker::Address.state,
                               country: Faker::Address.country,
                               parcel_width: Faker::Number.decimal(2),
                               parcel_length: Faker::Number.decimal(2),
                               parcel_height: Faker::Number.decimal(2),
                               parcel_weight: Faker::Number.decimal(2),
                               zip_code: Faker::Address.zip_code)).to be_valid
  end
end
