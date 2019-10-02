# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FedexAccount, type: :model do
  it 'is valid with valid attributes' do
    expect(FedexAccount.new(key: Faker::Lorem.characters(10),
                            password: Faker::Lorem.characters(10),
                            account_number: Faker::Number.number(10),
                            meter_number: Faker::Number.number(10),
                            name: Faker::Name.name,
                            company_name: Faker::Company.name,
                            phone_number: Faker::PhoneNumber.phone_number,
                            street: Faker::Address.street_address,
                            city: Faker::Address.city,
                            state: Faker::Address.state,
                            zip_code: Faker::Address.zip_code)).to be_valid
  end
end
