# frozen_string_literal: true

FactoryBot.define do
  factory :source_type do
    name {Faker::Company.name}
  end
end
