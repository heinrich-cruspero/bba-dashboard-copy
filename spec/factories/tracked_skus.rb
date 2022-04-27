# frozen_string_literal: true

FactoryBot.define do
  factory :tracked_sku do
    asin {Faker::Code.asin}
    isbn {Faker::Code.isbn}
    publication_date {Faker::Date.backward(days: 100)}
    title {Faker::Book.title}
    author {Faker::Book.author}
    publisher {Faker::Book.publisher}
    binding {Faker::Lorem.characters(number: 5)}
    condition {Faker::Lorem.characters(number: 5)}
    location {Faker::Lorem.characters(number: 5)}
    sku {Faker::Lorem.characters(number: 10)}
    locator_code {Faker::Lorem.characters(number: 10)}
    suffix {Faker::Lorem.characters(number: 10)}
    date_created {Faker::Date.backward(days: 100)}
    internal_price_4 {Faker::Number.decimal(l_digits: 2)}
    internal_notes_1 {Faker::Lorem.sentence}
    internal_notes_2 {Faker::Lorem.sentence}
    internal_notes_3 {Faker::Lorem.sentence}
  end
end
