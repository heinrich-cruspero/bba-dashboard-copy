# frozen_string_literal: true

##
class WantListsController < ApplicationController

  require 'csv'

  before_action :set_want_list, only: %i[edit update destroy items export]

  after_action :upload_items, only: %i[update create]

  # GET /want_lists
  def index
    respond_to do |format|
      format.html
      format.json { render json: WantListDatatable.new(params, view_context: view_context) }
    end
  end

  # GET /want_lists/new
  def new
    @want_list = WantList.new
  end

  # GET /want_lists/1/edit
  def edit
    return if @want_list.valore_account_id.nil?

    if @want_list.last_submitted_at.nil? ||
       (@want_list.active && !(['PROCESSED', 'PROCESSED WITH ERRORS'].include? @want_list.upload_status))
      redirect_to want_lists_path, notice: 'Unable to edit this want list!'
    end
  end

  # POST /want_lists
  def create
    @want_list = WantList.new(want_list_params)
    @want_list.owner = current_user

    respond_to do |format|
      if @want_list.save
        format.html { redirect_to want_lists_url, notice: 'Want list was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /want_lists/1
  def update
    respond_to do |format|
      if @want_list.update(want_list_params)
        format.html { redirect_to want_lists_url, notice: 'Want list was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /want_lists/1
  def destroy
    @want_list.destroy
    respond_to do |format|
      format.html { redirect_to want_lists_url, notice: 'Want list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /items/1
  def items
    respond_to do |format|
      format.html
      format.json { render json: WantListItemDatatable.new(view_context, want_list_id: @want_list.id) }
    end
  end

  def export
    send_data @want_list.want_list_items.to_csv, filename: "#{@want_list.name}.csv"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_want_list
    @want_list = WantList.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def want_list_params
    params.require(:want_list).permit(:name, :want_list_privacy_id, :valore_account_id,
                                      :valore_want_list_id, :valore_po_number, :valore_shipment_date, :valore_shipment_frequency,
                                      :abe_account_id, :thrift_account_id, :active, user_ids: [])
  end

  # After update & create process items file if exist
  def upload_items
    return if params[:want_list][:want_list_items].nil?

    @want_list.want_list_items.delete_all if params[:want_list][:reset] == '1'

    empty_want_list = @want_list.want_list_items.count.zero?

    want_list_id = @want_list.id

    Thread.new do
      @want_list.update(upload_status: 'IMPORTING FILE')
      CSV.foreach(params[:want_list][:want_list_items].path, headers: true) do |row|
        row_hash = row.to_hash
        row_hash['want_list_id'] = want_list_id
        valore_account = @want_list.valore_account

        unless valore_account.nil?
          max_price = row_hash['max_price'].to_f
          row_hash['fees'] = ((max_price * valore_account.percentage_fee / 100) + valore_account.flat_fee).round(2)
          book = Book.find_by_ean(row_hash['ean'])

          max_price_ceiling = 200
          max_price_ceiling = (book.list_price * 0.80) unless book.nil? || book.list_price.zero?

          unless (max_price + row_hash['fees']) < max_price_ceiling
            row_hash['fees'] = 0
            row_hash['max_price'] = max_price_ceiling
          end

          unless book.nil?
            result = DataWhApiService.new.get_book('ean', row_hash['ean'])
            Book.create_from_data_wh_result(result) unless result.empty?
          end
        end

        if empty_want_list
          WantListItem.create(row_hash)
        else
          WantListItem.where(want_list_id: want_list_id, ean: row_hash['ean']).first_or_create.update(row_hash)
        end
      end
      @want_list.update(upload_status: 'IMPORTED')
    end
  end
end
