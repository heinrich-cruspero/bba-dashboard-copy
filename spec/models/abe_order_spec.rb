# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AbeOrder, type: :model do
  it 'is valid with valid attributes' do
    expect(AbeOrder.new(order_id: Faker::Number.number(10), dryrun: Faker::Boolean.boolean(0.5), reference_id: Faker::Number.number(10))).to be_valid
  end

  it 'is not valid with no order_id' do
    expect(AbeOrder.new(dryrun: Faker::Boolean.boolean(0.5), reference_id: Faker::Number.number(10))).to_not be_valid
  end

  it 'is not valid with no reference_id' do
    expect(AbeOrder.new(order_id: Faker::Number.number(10), dryrun: Faker::Boolean.boolean(0.5))).to_not be_valid
  end
end
