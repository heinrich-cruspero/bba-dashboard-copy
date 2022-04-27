# frozen_string_literal: true

FactoryBot.define do
  factory :rental_return do
    fedex_account
    email {Faker::Internet.email}
    name {Faker::Name.name}
    phone_number {Faker::PhoneNumber.phone_number}
    street {Faker::Address.street_address}
    city {Faker::Address.city}
    state {Faker::Address.state}
    zip_code {Faker::Address.zip_code}
  end
end
