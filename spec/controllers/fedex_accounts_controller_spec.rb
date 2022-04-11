# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FedexAccountsController, type: :controller do
  before(:each) do
    sign_in create(:admin_user)
  end

  let(:valid_attributes) do
    { key: Faker::Lorem.characters(10), password: Faker::Lorem.characters(10),
      account_number: Faker::Number.number(10), meter_number: Faker::Number.number(10),
      name: Faker::Name.name, company_name: Faker::Company.name, phone_number: Faker::PhoneNumber.phone_number,
      street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state,
      zip_code: Faker::Address.zip_code }
  end

  let(:invalid_attributes) do
    { key: nil, password: Faker::Lorem.characters(10),
      account_number: Faker::Number.number(10), meter_number: Faker::Number.number(10),
      name: Faker::Name.name, company_name: Faker::Company.name, phone_number: Faker::PhoneNumber.phone_number,
      street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state,
      zip_code: Faker::Address.zip_code }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      fedex_account = FedexAccount.create! valid_attributes
      get :show, params: { id: fedex_account.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      fedex_account = FedexAccount.create! valid_attributes
      get :edit, params: { id: fedex_account.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new FedexAccount' do
        expect do
          post :create, params: { fedex_account: valid_attributes }, session: valid_session
        end.to change(FedexAccount, :count).by(1)
      end

      it 'redirects to the created fedex_account' do
        post :create, params: { fedex_account: valid_attributes }, session: valid_session
        expect(response).to redirect_to(FedexAccount.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { fedex_account: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { key: Faker::Lorem.characters(10), password: Faker::Lorem.characters(10),
          account_number: Faker::Number.number(10), meter_number: Faker::Number.number(10),
          name: Faker::Name.name, company_name: Faker::Company.name, phone_number: Faker::PhoneNumber.phone_number,
          street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state,
          zip_code: Faker::Address.zip_code }
      end

      it 'updates the requested fedex_account' do
        fedex_account = FedexAccount.create! valid_attributes
        put :update, params: { id: fedex_account.to_param, fedex_account: new_attributes }, session: valid_session
        fedex_account.reload
        expect(fedex_account.key).to eql new_attributes[:key]
      end

      it 'redirects to the fedex_account' do
        fedex_account = FedexAccount.create! valid_attributes
        put :update, params: { id: fedex_account.to_param, fedex_account: valid_attributes }, session: valid_session
        expect(response).to redirect_to(fedex_account)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        fedex_account = FedexAccount.create! valid_attributes
        put :update, params: { id: fedex_account.to_param, fedex_account: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested fedex_account' do
      fedex_account = FedexAccount.create! valid_attributes
      expect do
        delete :destroy, params: { id: fedex_account.to_param }, session: valid_session
      end.to change(FedexAccount, :count).by(-1)
    end

    it 'redirects to the fedex_accounts list' do
      fedex_account = FedexAccount.create! valid_attributes
      delete :destroy, params: { id: fedex_account.to_param }, session: valid_session
      expect(response).to redirect_to(fedex_accounts_url)
    end
  end
end
