# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuditsController, type: :controller do
  before(:each) do
    sign_in create(:admin_user)
  end

  let(:valid_attributes) do
    { sku: Faker::String.random(length: 10).delete("\u0000"), status: Faker::Boolean, notes: Faker::Lorem.sentence,
      internal_price_4: Faker::Number.decimal(l_digits: 2),
      internal_notes_1: Faker::Lorem.sentence, internal_notes_2: Faker::Lorem.sentence,
      internal_notes_3: Faker::Lorem.sentence, date_created: Faker::Date.backward(days: 100) }
  end

  let(:invalid_attributes) do
    { sku: nil, status: Faker::Boolean.boolean, notes: Faker::Lorem.sentence,
      internal_price_4: Faker::Number.decimal(l_digits: 2),
      internal_notes_1: Faker::Lorem.sentence, internal_notes_2: Faker::Lorem.sentence,
      internal_notes_3: Faker::Lorem.sentence, date_created: Faker::Date.backward(days: 100) }
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
      audit = Audit.create! valid_attributes
      get :show, params: { id: audit.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    context 'with valid params' do
      it 'returns a success response' do
        get :new, params: { tracked_sku: create(:tracked_sku) }, session: valid_session
        expect(response).to be_success
      end

      it 'redirects to the edit_audit_path' do
        tracked_sku = create(:tracked_sku)
        audit = create(:audit, sku: tracked_sku.sku)

        get :new, params: { tracked_sku: tracked_sku }, session: valid_session
        expect(response).to redirect_to(edit_audit_path(audit))
      end
    end

    context 'with invalid params' do
      it 'redirects to the tracked_skus_path' do
        get :new, params: { tracked_sku: 0 }, session: valid_session
        expect(response).to redirect_to(tracked_skus_path)
      end

      it 'redirects to the tracked_skus_path' do
        get :new, params: {}, session: valid_session
        expect(response).to redirect_to(tracked_skus_path)
      end
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      audit = Audit.create! valid_attributes
      get :edit, params: { id: audit.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Audit' do
        expect do
          post :create, params: { audit: valid_attributes }, session: valid_session
        end.to change(Audit, :count).by(1)
      end

      it 'redirects to the created audit' do
        post :create, params: { audit: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Audit.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { audit: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { sku: Faker::String.random(length: 10).delete("\u0000") }
      end

      it 'updates the requested audit' do
        audit = Audit.create! valid_attributes
        put :update, params: { id: audit.to_param, audit: new_attributes }, session: valid_session
        audit.reload
        expect(audit.sku).to eql new_attributes[:sku]
      end

      it 'redirects to the audit' do
        audit = Audit.create! valid_attributes
        put :update, params: { id: audit.to_param, audit: valid_attributes }, session: valid_session
        expect(response).to redirect_to(audit)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        audit = Audit.create! valid_attributes
        put :update, params: { id: audit.to_param, audit: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested audit' do
      audit = Audit.create! valid_attributes
      expect do
        delete :destroy, params: { id: audit.to_param }, session: valid_session
      end.to change(Audit, :count).by(-1)
    end

    it 'redirects to the audits list' do
      audit = Audit.create! valid_attributes
      delete :destroy, params: { id: audit.to_param }, session: valid_session
      expect(response).to redirect_to(audits_url)
    end
  end
end
