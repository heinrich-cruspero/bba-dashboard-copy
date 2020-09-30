# frozen_string_literal: true

##
class AccountsController < ApplicationController
  load_and_authorize_resource

  before_action :set_account, only: %i[show edit update destroy]

  def index
    respond_to do |format|
      format.html
      format.json { render json: AccountDatatable.new(params, view_context: view_context) }
    end
  end

  def show; end

  def new
    @account = Account.new
  end

  def edit; end

  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
    end
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:source_id, :name, :account_number, :address_ln1, :address_ln2, :city, :state, :zip, :phone_number, :extension)
  end
end
