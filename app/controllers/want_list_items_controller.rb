class WantListItemsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_want_list_item, only: [:show, :edit, :update, :destroy]

  # GET /want_list_items
  # GET /want_list_items.json
  def index
    @want_list_items = WantListItem.all
  end

  # GET /want_list_items/1
  # GET /want_list_items/1.json
  def show
  end

  # GET /want_list_items/new
  def new
    @want_list_item = WantListItem.new
  end

  # GET /want_list_items/1/edit
  def edit
  end

  # POST /want_list_items
  # POST /want_list_items.json
  def create
    @want_list_item = WantListItem.new(want_list_item_params)

    respond_to do |format|
      if @want_list_item.save
        format.html { redirect_to @want_list_item, notice: 'Want list item was successfully created.' }
        format.json { render :show, status: :created, location: @want_list_item }
      else
        format.html { render :new }
        format.json { render json: @want_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /want_list_items/1
  # PATCH/PUT /want_list_items/1.json
  def update
    respond_to do |format|
      if @want_list_item.update(want_list_item_params)
        format.html { redirect_to @want_list_item, notice: 'Want list item was successfully updated.' }
        format.json { render :show, status: :ok, location: @want_list_item }
      else
        format.html { render :edit }
        format.json { render json: @want_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /want_list_items/1
  # DELETE /want_list_items/1.json
  def destroy
    @want_list_item.destroy
    respond_to do |format|
      format.html { redirect_to want_list_items_url, notice: 'Want list item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_want_list_item
      @want_list_item = WantListItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def want_list_item_params
      params.require(:want_list_item).permit(:want_list_id, :isbn, :quantity)
    end
end
