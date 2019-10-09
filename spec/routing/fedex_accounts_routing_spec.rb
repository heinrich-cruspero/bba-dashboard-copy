# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FedexAccountsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/fedex_accounts').to route_to('fedex_accounts#index')
    end

    it 'routes to #new' do
      expect(get: '/fedex_accounts/new').to route_to('fedex_accounts#new')
    end

    it 'routes to #show' do
      expect(get: '/fedex_accounts/1').to route_to('fedex_accounts#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/fedex_accounts/1/edit').to route_to('fedex_accounts#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/fedex_accounts').to route_to('fedex_accounts#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/fedex_accounts/1').to route_to('fedex_accounts#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/fedex_accounts/1').to route_to('fedex_accounts#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/fedex_accounts/1').to route_to('fedex_accounts#destroy', id: '1')
    end
  end
end
