# frozen_string_literal: true

FactoryBot.define do
  factory :source do
    source_type create(:source_type)
    name Faker::Company.name
  end
end
