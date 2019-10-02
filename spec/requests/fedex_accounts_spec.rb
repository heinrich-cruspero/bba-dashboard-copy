# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'FedexAccounts', type: :request do
  before(:each) do
    sign_in create(:admin_user)
  end

  describe 'GET /fedex_accounts' do
    it 'works! (now write some real specs)' do
      get fedex_accounts_path
      expect(response).to have_http_status(200)
    end
  end
end
