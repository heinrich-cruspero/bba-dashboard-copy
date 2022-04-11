# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ThriftOrdersController, type: :controller do
  before(:each) do
    sign_in create(:admin_user)
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

  describe 'GET #items' do
    it 'returns a success response' do
      get :items, params: { id: create(:thrift_order) }, session: valid_session
      expect(response).to be_success
    end
  end
end
