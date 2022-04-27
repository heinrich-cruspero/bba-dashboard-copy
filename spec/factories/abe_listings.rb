# frozen_string_literal: true

FactoryBot.define do
  factory :abe_listing do
    abe_order
    listing_id {Faker::Number.number(digits: 7)}
    quantity {Faker::Number.digit}
    title {Faker::Book.title}
    isbn {Faker::Code.isbn}
    vendor_id {Faker::Number.number(digits: 7)}
    min_shipping_days {Faker::Number.digit}
    max_shipping_days {Faker::Number.digit}
  end
end
