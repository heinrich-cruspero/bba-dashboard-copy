# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RentalReturnsController, type: :controller do
  before(:each) do
    sign_in create(:admin_user)
  end

  let(:fedex_account) { create(:fedex_account) }

  let(:valid_attributes) do
    {
      accountable_id: fedex_account.id, email: Faker::Internet.email, name: Faker::Name.name,
      phone_number: Faker::PhoneNumber.phone_number, street: Faker::Address.street_address,
      city: Faker::Address.city, state: Faker::Address.state, zip_code: Faker::Address.zip_code,
      accountable_type: 'FedexAccount'
    }
  end

  let(:invalid_attributes) do
    {
      accountable_id: nil, email: Faker::Internet.email, name: Faker::Name.name,
      phone_number: Faker::PhoneNumber.phone_number, street: Faker::Address.street_address,
      city: Faker::Address.city, state: Faker::Address.state, zip_code: Faker::Address.zip_code
    }
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
      rental_return = RentalReturn.create! valid_attributes
      get :show, params: { id: rental_return.to_param }, session: valid_session
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
      rental_return = RentalReturn.create! valid_attributes
      get :edit, params: { id: rental_return.to_param }, session: valid_session
      expect(response.code).to eq('200')
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new RentalReturn' do
        expect do
          post :create, params: { rental_return: valid_attributes }, session: valid_session
        end.to change(RentalReturn, :count).by(1)
      end

      it 'redirects to the created rental_return' do
        post :create, params: { rental_return: valid_attributes }, session: valid_session
        expect(response).to redirect_to(RentalReturn.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { rental_return: invalid_attributes }, session: valid_session
        expect(response.code).to eq('200')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          accountable_id: fedex_account.id, email: Faker::Internet.email, name: Faker::Name.name,
          phone_number: Faker::PhoneNumber.phone_number, street: Faker::Address.street_address,
          city: Faker::Address.city, state: Faker::Address.state, zip_code: Faker::Address.zip_code
        }
      end

      it 'updates the requested rental_return' do
        rental_return = RentalReturn.create! valid_attributes
        put :update, params: { id: rental_return.to_param, rental_return: new_attributes }, session: valid_session
        rental_return.reload
        expect(rental_return.email).to eql new_attributes[:email]
      end

      it 'redirects to the rental_return' do
        rental_return = RentalReturn.create! valid_attributes
        put :update, params: { id: rental_return.to_param, rental_return: valid_attributes }, session: valid_session
        expect(response).to redirect_to(rental_return)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        rental_return = RentalReturn.create! valid_attributes
        put :update, params: { id: rental_return.to_param, rental_return: invalid_attributes }, session: valid_session
        expect(response.code).to eq('200')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested rental_return' do
      rental_return = RentalReturn.create! valid_attributes
      expect do
        delete :destroy, params: { id: rental_return.to_param }, session: valid_session
      end.to change(RentalReturn, :count).by(-1)
    end

    it 'redirects to the rental_returns list' do
      rental_return = RentalReturn.create! valid_attributes
      delete :destroy, params: { id: rental_return.to_param }, session: valid_session
      expect(response).to redirect_to(rental_returns_url)
    end
  end
end
