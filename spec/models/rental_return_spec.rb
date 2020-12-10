# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RentalReturn, type: :model do
  let(:fedex_account) { create(:fedex_account) }

  it 'is valid with valid attributes' do
    expect(RentalReturn.new(accountable: fedex_account,
                            email: Faker::Internet.email,
                            name: Faker::Name.name,
                            phone_number: Faker::PhoneNumber.phone_number,
                            street: Faker::Address.street_address,
                            city: Faker::Address.city,
                            state: Faker::Address.state,
                            zip_code: Faker::Address.zip_code)).to be_valid
  end
end
