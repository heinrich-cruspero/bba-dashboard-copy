# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:source) { create(:source) }

  it 'is valid with valid attributes' do
    expect(Account.new(source: source, name: Faker::Company.name, account_number: Faker::Company.ein,
                       address_ln1: Faker::Address.street_address, address_ln2: Faker::Address.secondary_address,
                       city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip,
                       phone_number: Faker::PhoneNumber.phone_number, extension: Faker::PhoneNumber.extension)).to be_valid
  end

  it 'is not valid with no source' do
    expect(Account.new(name: Faker::Company.name, account_number: Faker::Company.ein,
                       address_ln1: Faker::Address.street_address, address_ln2: Faker::Address.secondary_address,
                       city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip,
                       phone_number: Faker::PhoneNumber.phone_number, extension: Faker::PhoneNumber.extension)).to_not be_valid
  end
end
