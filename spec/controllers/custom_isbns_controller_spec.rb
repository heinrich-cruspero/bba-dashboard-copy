# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomIsbnsController, type: :controller do
  before(:each) do
    sign_in create(:admin_user)
  end

  let(:valid_attributes) do
    { text_isbn: Faker::Code.asin, alt_isbn: Faker::Code.asin, custom_isbn: Faker::Code.asin, code_isbn: Faker::Code.asin, tag: Faker::Book.genre }
  end

  let(:invalid_attributes) do
    { alt_isbn: Faker::Code.asin, custom_isbn: Faker::Code.asin, code_isbn: Faker::Code.asin, tag: Faker::Book.genre }
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
      custom_isbn = CustomIsbn.create! valid_attributes
      get :show, params: { id: custom_isbn.to_param }, session: valid_session
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
      custom_isbn = CustomIsbn.create! valid_attributes
      get :edit, params: { id: custom_isbn.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new CustomIsbn' do
        expect do
          post :create, params: { custom_isbn: valid_attributes }, session: valid_session
        end.to change(CustomIsbn, :count).by(1)
      end

      it 'redirects to the created custom_isbn' do
        post :create, params: { custom_isbn: valid_attributes }, session: valid_session
        expect(response).to redirect_to(CustomIsbn.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { custom_isbn: invalid_attributes }, session: valid_session
        expect(response).to_not be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { text_isbn: Faker::Code.asin }
      end

      it 'updates the requested custom_isbn' do
        custom_isbn = CustomIsbn.create! valid_attributes
        put :update, params: { id: custom_isbn.to_param, custom_isbn: new_attributes }, session: valid_session
        custom_isbn.reload
        expect(custom_isbn.text_isbn).to eql new_attributes[:text_isbn]
      end

      it 'redirects to the custom_isbn' do
        custom_isbn = CustomIsbn.create! valid_attributes
        put :update, params: { id: custom_isbn.to_param, custom_isbn: valid_attributes }, session: valid_session
        expect(response).to redirect_to(custom_isbn)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        custom_isbn = CustomIsbn.create! valid_attributes
        put :update, params: { id: custom_isbn.to_param, custom_isbn: invalid_attributes }, session: valid_session
        expect(response).to_not be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested custom_isbn' do
      custom_isbn = CustomIsbn.create! valid_attributes
      expect do
        delete :destroy, params: { id: custom_isbn.to_param }, session: valid_session
      end.to change(CustomIsbn, :count).by(-1)
    end

    it 'redirects to the custom_isbns list' do
      custom_isbn = CustomIsbn.create! valid_attributes
      delete :destroy, params: { id: custom_isbn.to_param }, session: valid_session
      expect(response).to redirect_to(custom_isbns_url)
    end
  end
end
