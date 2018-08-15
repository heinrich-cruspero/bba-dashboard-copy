# frozen_string_literal: true

FactoryBot.define do
  factory :abe_order_item do
    abe_listing
    abe_order
    cost Faker::Commerce.price
    shipcost Faker::Commerce.price
    status [0o4, 0o5, 14, 19, 24, 35, 53, 90, 93].sample
    order_item_id Faker::Number.number(10)
  end
end
