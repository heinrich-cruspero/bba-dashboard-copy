# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Audit, type: :model do
  it 'is valid with valid attributes' do
    expect(Audit.new(sku: Faker::String.random(10), status: Faker::Boolean.boolean, notes: Faker::Lorem.sentence,
                     internal_price_1: Faker::Number.decimal(2), internal_price_2: Faker::Number.decimal(2),
                     internal_price_3: Faker::Number.decimal(2), internal_price_4: Faker::Number.decimal(2),
                     date_created: Faker::Date)).to be_valid
  end

  it 'is not valid with no sku' do
    expect(Audit.new(sku: nil, status: Faker::Boolean.boolean, notes: Faker::Lorem.sentence,
                     internal_price_1: Faker::Number.decimal(2), internal_price_2: Faker::Number.decimal(2),
                     internal_price_3: Faker::Number.decimal(2), internal_price_4: Faker::Number.decimal(2),
                     date_created: Faker::Date)).to_not be_valid
  end

  it 'is not valid with no status' do
    expect(Audit.new(sku: Faker::String.random(10), status: nil, notes: Faker::Lorem.sentence,
                     internal_price_1: Faker::Number.decimal(2), internal_price_2: Faker::Number.decimal(2),
                     internal_price_3: Faker::Number.decimal(2), internal_price_4: Faker::Number.decimal(2),
                     date_created: Faker::Date)).to_not be_valid
  end

  it 'is not valid with no internal_price_1' do
    expect(Audit.new(sku: Faker::String.random(10), status: Faker::Boolean.boolean, notes: Faker::Lorem.sentence,
                     internal_price_1: nil, internal_price_2: Faker::Number.decimal(2),
                     internal_price_3: Faker::Number.decimal(2), internal_price_4: Faker::Number.decimal(2),
                     date_created: Faker::Date)).to_not be_valid
  end

  it 'is not valid with no internal_price_2' do
    expect(Audit.new(sku: Faker::String.random(10), status: Faker::Boolean.boolean, notes: Faker::Lorem.sentence,
                     internal_price_1: Faker::Number.decimal(2), internal_price_2: nil,
                     internal_price_3: Faker::Number.decimal(2), internal_price_4: Faker::Number.decimal(2),
                     date_created: Faker::Date)).to_not be_valid
  end

  it 'is not valid with no internal_price_3' do
    expect(Audit.new(sku: Faker::String.random(10), status: Faker::Boolean.boolean, notes: Faker::Lorem.sentence,
                     internal_price_1: Faker::Number.decimal(2), internal_price_2: Faker::Number.decimal(2),
                     internal_price_3: nil, internal_price_4: Faker::Number.decimal(2),
                     date_created: Faker::Date)).to_not be_valid
  end

  it 'is not valid with no internal_price_4' do
    expect(Audit.new(sku: Faker::String.random(10), status: Faker::Boolean.boolean, notes: Faker::Lorem.sentence,
                     internal_price_1: Faker::Number.decimal(2), internal_price_2: Faker::Number.decimal(2),
                     internal_price_3: Faker::Number.decimal(2), internal_price_4: nil,
                     date_created: Faker::Date)).to_not be_valid
  end

  it 'is not valid with no date_created' do
    expect(Audit.new(sku: Faker::String.random(10), status: Faker::Boolean.boolean, notes: Faker::Lorem.sentence,
                     internal_price_1: Faker::Number.decimal(2), internal_price_2: Faker::Number.decimal(2),
                     internal_price_3: Faker::Number.decimal(2), internal_price_4: Faker::Number.decimal(2),
                     date_created: nil)).to_not be_valid
  end
end
