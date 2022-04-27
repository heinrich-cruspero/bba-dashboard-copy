# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AbeListing, type: :model do
  let(:abe_order) { create(:abe_order) }

  it 'is valid with valid attributes' do
    expect(AbeListing.new(abe_order: abe_order, listing_id: Faker::Number.number(digits: 10), quantity: Faker::Number.digit,
                          title: Faker::Book.title, isbn: Faker::Code, vendor_id: Faker::Number.number(digits: 10),
                          min_shipping_days: Faker::Number.digit, max_shipping_days: Faker::Number.digit)).to be_valid
  end

  it 'is not valid with no abe_order' do
    expect(AbeListing.new(listing_id: Faker::Number.number(digits: 10), quantity: Faker::Number.digit,
                          title: Faker::Book.title, isbn: Faker::Code, vendor_id: Faker::Number.number(digits: 10),
                          min_shipping_days: Faker::Number.digit, max_shipping_days: Faker::Number.digit)).to_not be_valid
  end

  it 'is not valid with no listing_id' do
    expect(AbeListing.new(abe_order: abe_order, quantity: Faker::Number.digit,
                          title: Faker::Book.title, isbn: Faker::Code, vendor_id: Faker::Number.number(digits: 10),
                          min_shipping_days: Faker::Number.digit, max_shipping_days: Faker::Number.digit)).to_not be_valid
  end

  it 'is not valid with no quantity' do
    expect(AbeListing.new(abe_order: abe_order, listing_id: Faker::Number.number(digits: 10),
                          title: Faker::Book.title, isbn: Faker::Code, vendor_id: Faker::Number.number(digits: 10),
                          min_shipping_days: Faker::Number.digit, max_shipping_days: Faker::Number.digit)).to_not be_valid
  end

  it 'is not valid with no title' do
    expect(AbeListing.new(abe_order: abe_order, listing_id: Faker::Number.number(digits: 10), quantity: Faker::Number.digit,
                          isbn: Faker::Code, vendor_id: Faker::Number.number(digits: 10),
                          min_shipping_days: Faker::Number.digit, max_shipping_days: Faker::Number.digit)).to_not be_valid
  end

  it 'is not valid with no isbn' do
    expect(AbeListing.new(abe_order: abe_order, listing_id: Faker::Number.number(digits: 10), quantity: Faker::Number.digit,
                          title: Faker::Book.title, vendor_id: Faker::Number.number(digits: 10),
                          min_shipping_days: Faker::Number.digit, max_shipping_days: Faker::Number.digit)).to_not be_valid
  end

  it 'is not valid with no vendor_id' do
    expect(AbeListing.new(abe_order: abe_order, listing_id: Faker::Number.number(digits: 10), quantity: Faker::Number.digit,
                          title: Faker::Book.title, isbn: Faker::Code,
                          min_shipping_days: Faker::Number.digit, max_shipping_days: Faker::Number.digit)).to_not be_valid
  end

  it 'is not valid with no min_shipping_days' do
    expect(AbeListing.new(listing_id: Faker::Number.number(digits: 10), quantity: Faker::Number.digit,
                          title: Faker::Book.title, isbn: Faker::Code, vendor_id: Faker::Number.number(digits: 10),
                          max_shipping_days: Faker::Number.digit)).to_not be_valid
  end

  it 'is not valid with no max_shipping_days' do
    expect(AbeListing.new(abe_order: abe_order, listing_id: Faker::Number.number(digits: 10), quantity: Faker::Number.digit,
                          title: Faker::Book.title, isbn: Faker::Code, vendor_id: Faker::Number.number(digits: 10),
                          min_shipping_days: Faker::Number.digit)).to_not be_valid
  end
end
