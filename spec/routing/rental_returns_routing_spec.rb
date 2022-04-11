# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RentalReturnsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/rental_returns').to route_to('rental_returns#index')
    end

    it 'routes to #new' do
      expect(get: '/rental_returns/new').to route_to('rental_returns#new')
    end

    it 'routes to #show' do
      expect(get: '/rental_returns/1').to route_to('rental_returns#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/rental_returns/1/edit').to route_to('rental_returns#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/rental_returns').to route_to('rental_returns#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/rental_returns/1').to route_to('rental_returns#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/rental_returns/1').to route_to('rental_returns#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/rental_returns/1').to route_to('rental_returns#destroy', id: '1')
    end
  end
end
