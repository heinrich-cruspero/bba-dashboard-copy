# frozen_string_literal: true

FactoryBot.define do
  factory :want_list do
    name {'MyString'}
    owner { create(:admin_user) }
    active { Faker::Boolean.boolean }
    want_list_privacy
  end
end
