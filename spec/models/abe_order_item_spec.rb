# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AbeOrderItem, type: :model do
  let(:abe_listing) { create(:abe_listing) }
  let(:abe_order) { create(:abe_order) }

  it 'is valid with valid attributes' do
    expect(AbeOrderItem.new(abe_listing: abe_listing, abe_order: abe_order, cost: Faker::Commerce.price, shipcost: Faker::Commerce.price,
                            status: [0o4, 0o5, 14, 19, 24, 35, 53, 90, 93].sample, order_item_id: Faker::Number.number(digits: 10))).to be_valid
  end

  it 'is not valid with no abe_listing' do
    expect(AbeOrderItem.new(abe_order: abe_order, cost: Faker::Commerce.price, shipcost: Faker::Commerce.price,
                            status: [0o4, 0o5, 14, 19, 24, 35, 53, 90, 93].sample, order_item_id: Faker::Number.number(digits: 10))).to_not be_valid
  end

  it 'is not valid with no abe_order' do
    expect(AbeOrderItem.new(abe_listing: abe_listing, cost: Faker::Commerce.price, shipcost: Faker::Commerce.price,
                            status: [0o4, 0o5, 14, 19, 24, 35, 53, 90, 93].sample, order_item_id: Faker::Number.number(digits: 10))).to_not be_valid
  end

  it 'is not valid with no cost' do
    expect(AbeOrderItem.new(abe_listing: abe_listing, abe_order: abe_order, shipcost: Faker::Commerce.price,
                            status: [0o4, 0o5, 14, 19, 24, 35, 53, 90, 93].sample, order_item_id: Faker::Number.number(digits: 10))).to_not be_valid
  end

  it 'is not valid with no shipcost' do
    expect(AbeOrderItem.new(abe_listing: abe_listing, abe_order: abe_order, cost: Faker::Commerce.price,
                            status: [0o4, 0o5, 14, 19, 24, 35, 53, 90, 93].sample, order_item_id: Faker::Number.number(digits: 10))).to_not be_valid
  end

  it 'is not valid with no status' do
    expect(AbeOrderItem.new(abe_listing: abe_listing, abe_order: abe_order, cost: Faker::Commerce.price, shipcost: Faker::Commerce.price,
                            order_item_id: Faker::Number.number(digits: 10))).to_not be_valid
  end

  it 'is not valid with no order_item_id' do
    expect(AbeOrderItem.new(abe_listing: abe_listing, abe_order: abe_order, cost: Faker::Commerce.price, shipcost: Faker::Commerce.price,
                            status: [0o4, 0o5, 14, 19, 24, 35, 53, 90, 93].sample)).to_not be_valid
  end
end
