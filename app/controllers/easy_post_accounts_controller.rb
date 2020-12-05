# frozen_string_literal: true

##
class EasyPostAccountsController < ApplicationController
  before_action :set_easy_post_account, only: %i[show edit update destroy]

  def index
    @easy_post_accounts = EasyPostAccount.all
  end

  def show; end

  def new
    @easy_post_account = EasyPostAccount.new
  end

  def edit; end

  def create
    @easy_post_account = EasyPostAccount.new(easy_post_account_params)

    respond_to do |format|
      if @easy_post_account.save
        format.html { redirect_to @easy_post_account, notice: 'Easypost account was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @easy_post_account.update(easy_post_account_params)
        format.html { redirect_to @easy_post_account, notice: 'Easypost account was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @easy_post_account.destroy
    respond_to do |format|
      format.html { redirect_to easy_post_accounts_url, notice: 'Easypost account was successfully destroyed.' }
    end
  end

  private

  def set_easy_post_account
    @easy_post_account = EasyPostAccount.find(params[:id])
  end

  def easy_post_account_params
    params.require(:easy_post_account).permit(:key, :account_number, :name, :company_name, :phone_number, :street, :city, :state, :zip_code, :country, :prod, user_ids: [])
  end
end
