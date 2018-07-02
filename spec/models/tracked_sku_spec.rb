# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TrackedSku, type: :model do
  it 'is valid with valid attributes' do
    expect(TrackedSku.new).to be_valid
  end
end
