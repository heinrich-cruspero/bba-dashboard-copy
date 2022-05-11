# frozen_string_literal: true

FactoryBot.define do
  factory :thrift_order_item do
    thrift_order {nil}
    sku {'MyString'}
    status {'MyString'}
  end
end
