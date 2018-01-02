class WantListsController < ApplicationController
  load_and_authorize_resource

  require 'csv'

  before_action :set_want_list, only: [:edit, :update, :destroy, :items]

  after_action :upload_items, only: [:update, :create]

  # GET /want_lists
  def index
    respond_to do |format|
      format.html
      format.json { render json: WantListDatatable.new(view_context) }
    end
  end

  # GET /want_lists/new
  def new
    @want_list = WantList.new
  end

  # GET /want_lists/1/edit
  def edit
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
        format.html { redirect_to @want_list, notice: 'Want list was successfully updated.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_want_list
      @want_list = WantList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def want_list_params
      params.require(:want_list).permit(:name, :user_id, :want_list_privacy_id)
    end

    # After update & create process items file if exist
    def upload_items
      return if params[:want_list][:want_list_items].nil?

      @want_list.want_list_items.delete_all

      CSV.foreach(params[:want_list][:want_list_items].path, headers: true) do |row|
        @want_list.want_list_items << WantListItem.new(row.to_hash)
      end
    end
end
