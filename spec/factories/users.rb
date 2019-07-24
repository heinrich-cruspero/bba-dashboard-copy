# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    password 'password'
    email 'user@example.com'

    factory :admin_user do
      admin true
      email { Faker::Internet.email }
    end
  end
end
