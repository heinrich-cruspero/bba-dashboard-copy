# frozen_string_literal: true

FactoryBot.define do
  factory :fedex_account do
    key {Faker::Lorem.characters(number: 10)}
    password {Faker::Lorem.characters(number: 10)}
    account_number {Faker::Number.number(digits: 10)}
    meter_number {Faker::Number.number(digits: 10)}
    name {Faker::Name.name}
    company_name {Faker::Company.name}
    phone_number {Faker::PhoneNumber.phone_number}
    street {Faker::Address.street_address}
    city {Faker::Address.city}
    state {Faker::Address.state}
    zip_code {Faker::Address.zip_code}
  end
end
