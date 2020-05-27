# frozen_string_literal: true

##
class FedexAccountsController < ApplicationController
  before_action :set_fedex_account, only: %i[show edit update destroy]

  def index
    @fedex_accounts = FedexAccount.all
  end

  def show; end

  def new
    @fedex_account = FedexAccount.new
  end

  def edit; end

  def create
    @fedex_account = FedexAccount.new(fedex_attrs)
    respond_to do |format|
      if @fedex_account.save
        UserStore.create(fedex_account_id: @fedex_account.id, user_id: params[:fedex_account][:user_id])
        format.html { redirect_to @fedex_account, notice: 'Fedex account was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @fedex_account.update(fedex_attrs)
        if UserStore.exists?(fedex_account_id: @fedex_account.id, user_id: params[:fedex_account][:user_id])
          UserStore.update(fedex_account_id: @fedex_account.id, user_id: params[:fedex_account][:user_id])
        else
          UserStore.create(fedex_account_id: @fedex_account.id, user_id: params[:fedex_account][:user_id])
        end
        format.html { redirect_to @fedex_account, notice: 'Fedex account was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @fedex_account.destroy
    respond_to do |format|
      format.html { redirect_to fedex_accounts_url, notice: 'Fedex account was successfully destroyed.' }
    end
  end

  private

  def set_fedex_account
    @fedex_account = FedexAccount.find(params[:id])
  end

  def fedex_attrs
    attrs = fedex_account_params.deep_dup
    attrs.delete(:user_id)
    attrs
  end

  def fedex_account_params
    params.require(:fedex_account).permit(:key, :password, :account_number, :meter_number, :name, :company_name, :phone_number, :street, :city, :state, :zip_code, :prod).tap do |whitelist|
      whitelist[:user_id] = params[:fedex_account][:user_id]
    end
  end
end
