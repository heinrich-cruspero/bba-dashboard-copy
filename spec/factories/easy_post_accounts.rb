# frozen_string_literal: true

FactoryBot.define do
  factory :easy_post_account do
    key Faker::Lorem.characters(number: 10)
    account_number Faker::Number.number(digits: 10)
    name Faker::Name.name
    company_name Faker::Company.name
    phone_number Faker::PhoneNumber.phone_number
    street Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state
    zip_code Faker::Address.zip_code
    country Faker::Address.country
    parcel_width Faker::Number.decimal(l_digits: 2)
    parcel_length Faker::Number.decimal(l_digits: 2)
    parcel_height Faker::Number.decimal(l_digits: 2)
    parcel_weight Faker::Number.decimal(l_digits: 2)
  end
end
