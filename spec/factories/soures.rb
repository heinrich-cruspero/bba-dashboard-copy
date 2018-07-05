# frozen_string_literal: true

FactoryBot.define do
  factory :source do
    association :source_type
    name Faker::Company.name
  end
end
