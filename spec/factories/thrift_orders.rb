# frozen_string_literal: true

FactoryBot.define do
  factory :thrift_order do
    cart_id 'MyString'
    external_order_id 'MyString'
    want_list
  end
end
