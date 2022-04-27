# frozen_string_literal: true

FactoryBot.define do
  factory :abe_order do
    order_id Faker::Number.number(digits: 10)
    dryrun Faker::Boolean.boolean(true_ratio: 0.5)
    reference_id Faker::Number.number(digits: 10)
  end
end
