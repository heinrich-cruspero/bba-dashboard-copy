# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SourceType, type: :model do
  it 'is valid with valid attributes' do
    expect(SourceType.new(name: 'Test')).to be_valid
  end
  it 'is not valid with no name' do
    expect(SourceType.new).to_not be_valid
  end
end
