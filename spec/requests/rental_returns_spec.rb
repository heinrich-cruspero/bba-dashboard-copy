# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'RentalReturns', type: :request do
  before(:each) do
    sign_in create(:admin_user)
  end

  describe 'GET /rental_returns' do
    it 'works! (now write some real specs)' do
      get rental_returns_path
      expect(response).to have_http_status(200)
    end
  end
end
