# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Audit, type: :model do
  it 'is valid with valid attributes' do
    expect(Audit.new(sku: Faker::String.random(length: 10), status: Faker::Boolean.boolean, notes: Faker::Lorem.sentence,
                     internal_notes_1: Faker::Lorem.sentence, internal_notes_2: Faker::Lorem.sentence,
                     internal_notes_3: Faker::Lorem.sentence, internal_price_4: Faker::Number.decimal(l_digits: 2),
                     date_created: Faker::Date)).to be_valid
  end

  it 'is not valid with no sku' do
    expect(Audit.new(sku: nil, status: Faker::Boolean.boolean, notes: Faker::Lorem.sentence,
                     internal_notes_1: Faker::Lorem.sentence, internal_notes_2: Faker::Lorem.sentence,
                     internal_notes_3: Faker::Lorem.sentence, internal_price_4: Faker::Number.decimal(l_digits: 2),
                     date_created: Faker::Date)).to_not be_valid
  end
end
