# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    password {'password'}
    email {'user@rev365.com'}

    factory :admin_user do
      role {:admin}
      email { 'joe@rev365.com' }
    end

    factory :admin_user2 do
      role {:admin}
      email { 'smith@rev365.com' }
    end
  end
end
