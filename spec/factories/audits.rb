# frozen_string_literal: true

FactoryBot.define do
  factory :audit do
    sku Faker::Lorem.characters(10)
    status Faker::Boolean.boolean
    notes Faker::Lorem.sentence
    internal_price_1 Faker::Number.decimal(2)
    internal_price_2 Faker::Number.decimal(2)
    internal_price_3 Faker::Number.decimal(2)
    internal_price_4 Faker::Number.decimal(2)
    date_created Faker::Date.backward(100)
  end
end
