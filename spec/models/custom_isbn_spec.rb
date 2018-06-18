# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomIsbn, type: :model do
  it 'is not valid with no attributes' do
    expect(CustomIsbn.new).to be_valid
  end
end
