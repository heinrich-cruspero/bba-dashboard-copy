# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CustomIsbns', type: :request do
  before(:each) do
    sign_in create(:admin_user)
  end

  describe 'GET /custom_isbns' do
    it 'works! (now write some real specs)' do
      get custom_isbns_path
      expect(response).to have_http_status(200)
    end
  end
end
