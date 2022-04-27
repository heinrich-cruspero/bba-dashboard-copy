# frozen_string_literal: true

FactoryBot.define do
  factory :audit do
    sku Faker::Lorem.characters(number: 10)
    status Faker::Boolean.boolean
    notes Faker::Lorem.sentence
    internal_price_4 Faker::Number.decimal(l_digits: 2)
    internal_notes_1 Faker::Lorem.sentence
    internal_notes_2 Faker::Lorem.sentence
    internal_notes_3 Faker::Lorem.sentence
    date_created Faker::Date.backward(days: 100)
  end
end
