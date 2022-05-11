# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }

    factory :admin_user do
      role { :admin }
      email { Faker::Internet.email }
    end
  end
end
