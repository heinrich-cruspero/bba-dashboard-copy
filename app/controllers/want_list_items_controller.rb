# frozen_string_literal: true

##
class WantListItemsController < ApplicationController
  load_and_authorize_resource

  before_action :set_want_list_item, only: %i[edit update destroy]
  before_action :set_session_referer, only: %i[edit new]

  # GET /want_list_items
  def index
    respond_to do |format|
      format.html
      format.json { render json: AllWantListItemDatatable.new(params, view_context: view_context) }
    end
  end

  def new
    @want_list_item = WantListItem.new(expiration_date: session[:expiration_date])
  end

  # POST /want_list_items.json
  def create
    @want_list_item = WantListItem.where(want_list_id: params[:want_list_item][:want_list_id], ean: params[:want_list_item][:ean]).first
    if @want_list_item.nil?
      @want_list_item = WantListItem.new(want_list_item_params)
    else
      @want_list_item.update(want_list_item_params)
    end

    respond_to do |format|
      if @want_list_item.save
        if @want_list_item.book.nil?
          result = DataWhApiService.new.get_book('ean', @want_list_item.ean)
          Book.create_from_data_wh_result(result) unless result.empty?
        end

        session[:expiration_date] = @want_list_item.expiration_date

        format.html { redirect_to session[:request_referer].nil? ? request.referer : session[:request_referer], notice: 'Want_list_item was successfully created.' }
        format.json { render status: :created, location: @want_list_item }
      else
        format.html { render :new }
        format.json { render status: :unprocessable_entity, location: @want_list_item }
      end
    end
  end

  # GET /want_list_items/1/edit
  def edit; end

  # PATCH/PUT /want_list_items/1
  def update
    respond_to do |format|
      if @want_list_item.update(want_list_item_params)
        format.html do
          redirect_to session[:request_referer].nil? ? request.referer : session[:request_referer],
                      notice: 'Want list item was successfully updated.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /want_list_items/1
  def destroy
    @want_list_item.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Want list item was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_want_list_item
    @want_list_item = WantListItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def want_list_item_params
    params.require(:want_list_item).permit(:ean, :want_list_id, :quantity, :quantity_purchased, :max_price, :expiration_date)
  end

  def set_session_referer
    session[:request_referer] = request.referer
  end
end
