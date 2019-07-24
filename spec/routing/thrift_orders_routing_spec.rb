# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ThriftOrdersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/thrift_orders').to route_to('thrift_orders#index')
    end
  end
end
