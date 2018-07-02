# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TrackedSkusController, type: :controller do
  before(:each) do
    user = User.create(email: 'user@example.org', password: 'very-secret', admin: true)

    sign_in user
  end

  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end
end
