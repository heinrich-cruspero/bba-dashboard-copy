# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  before(:each) do
    sign_in create(:admin_user)
  end

  let(:source) { create(:source) }

  let(:valid_attributes) do
    { source_id: source.id, name: Faker::Company.name, account_number: Faker::Company.ein,
      address_ln1: Faker::Address.street_address, address_ln2: Faker::Address.secondary_address,
      city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip,
      phone_number: Faker::PhoneNumber.phone_number, extension: Faker::PhoneNumber.extension }
  end

  let(:invalid_attributes) do
    { name: Faker::Company.name, account_number: Faker::Company.ein,
      address_ln1: Faker::Address.street_address, address_ln2: Faker::Address.secondary_address,
      city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip,
      phone_number: Faker::PhoneNumber.phone_number, extension: Faker::PhoneNumber.extension }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response.code).to eq('200')
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      account = Account.create! valid_attributes
      get :show, params: { id: account.to_param }, session: valid_session
      expect(response.code).to eq('200')
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response.code).to eq('200')
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      account = Account.create! valid_attributes
      get :edit, params: { id: account.to_param }, session: valid_session
      expect(response.code).to eq('200')
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Account' do
        expect do
          post :create, params: { account: valid_attributes }, session: valid_session
        end.to change(Account, :count).by(1)
      end

      it 'redirects to the created account' do
        post :create, params: { account: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Account.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { account: invalid_attributes }, session: valid_session
        expect(response.code).to_not eq('200')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { name: Faker::Company.name }
      end

      it 'updates the requested account' do
        account = Account.create! valid_attributes
        put :update, params: { id: account.to_param, account: new_attributes }, session: valid_session
        account.reload
        expect(account.name).to eql new_attributes[:name]
      end

      it 'redirects to the account' do
        account = Account.create! valid_attributes
        put :update, params: { id: account.to_param, account: valid_attributes }, session: valid_session
        expect(response).to redirect_to(account)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        account = Account.create! valid_attributes
        put :update, params: { id: account.to_param, account: invalid_attributes }, session: valid_session
        expect(response.code).to eq('302')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested account' do
      account = Account.create! valid_attributes
      expect do
        delete :destroy, params: { id: account.to_param }, session: valid_session
      end.to change(Account, :count).by(-1)
    end

    it 'redirects to the accounts list' do
      account = Account.create! valid_attributes
      delete :destroy, params: { id: account.to_param }, session: valid_session
      expect(response).to redirect_to(accounts_url)
    end
  end
end
