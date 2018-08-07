# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TrackedSkusController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/tracked_skus').to route_to('tracked_skus#index')
    end
  end
end
