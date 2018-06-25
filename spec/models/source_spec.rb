# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Source, type: :model do
  let!(:source_type) { SourceType.create(name: 'Test') }

  it 'is valid with valid attributes' do
    expect(Source.new(source_type: source_type, name: 'Test')).to be_valid
  end

  it 'is not valid with no name' do
    expect(Source.new(source_type: source_type)).to_not be_valid
  end

  it 'is not valid with no source_tye' do
    expect(Source.new(name: 'Test')).to_not be_valid
  end
end
