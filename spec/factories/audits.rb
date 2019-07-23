# frozen_string_literal: true

FactoryBot.define do
  factory :audit do
    sku Faker::Lorem.characters(10)
    status Faker::Boolean.boolean
    notes Faker::Lorem.sentence
    internal_price_4 Faker::Number.decimal(2)
    internal_notes_1 Faker::Lorem.sentence
    internal_notes_2 Faker::Lorem.sentence
    internal_notes_3 Faker::Lorem.sentence
    date_created Faker::Date.backward(100)
  end
end
