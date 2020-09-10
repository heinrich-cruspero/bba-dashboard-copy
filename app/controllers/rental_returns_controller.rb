# frozen_string_literal: true

##
class RentalReturnsController < ApplicationController
  before_action :set_rental_return, only: %i[show edit update destroy]

  def index
    respond_to do |format|
      format.html
      format.json { render json: RentalReturnDatatable.new(params, view_context: view_context) }
    end
  end

  def show; end

  def new
    @rental_return = RentalReturn.new
  end

  def edit; end

  def create
    @rental_return = RentalReturn.new(rental_return_params)

    respond_to do |format|
      if @rental_return.save
        format.html { redirect_to @rental_return, notice: 'Rental return was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @rental_return.update(rental_return_params)
        format.html { redirect_to @rental_return, notice: 'Rental return was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @rental_return.destroy
    respond_to do |format|
      format.html { redirect_to rental_returns_url, notice: 'Rental return was successfully destroyed.' }
    end
  end

  def import
    RentalReturn.import(params[:rental_returns_file], params[:fedex_account_id])
    GenerateReturnsJob.perform_later
    redirect_to rental_returns_path, notice: 'Rental Returns Imported'
  end

  private

  def set_rental_return
    @rental_return = RentalReturn.find(params[:id])
  end

  def rental_return_params
    params.require(:rental_return).permit(:fedex_account_id, :email, :name, :phone_number, :street, :city, :state, :zip_code, :response)
  end
end
