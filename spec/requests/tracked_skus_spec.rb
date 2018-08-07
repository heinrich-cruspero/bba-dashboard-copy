# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TrackedSkus', type: :request do
  before(:each) do
    sign_in create(:admin_user)
  end

  describe 'GET /tracked_skus' do
    it 'works! (now write some real specs)' do
      get tracked_skus_path
      expect(response).to have_http_status(200)
    end
  end
end
