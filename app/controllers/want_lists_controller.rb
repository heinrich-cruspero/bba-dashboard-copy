class WantListsController < ApplicationController
  before_action :set_want_list, only: [:show, :edit, :update, :destroy]

  # GET /want_lists
  # GET /want_lists.json
  def index
    @want_lists = WantList.all
  end

  # GET /want_lists/1
  # GET /want_lists/1.json
  def show
  end

  # GET /want_lists/new
  def new
    @want_list = WantList.new
  end

  # GET /want_lists/1/edit
  def edit
  end

  # POST /want_lists
  # POST /want_lists.json
  def create
    @want_list = WantList.new(want_list_params)

    respond_to do |format|
      if @want_list.save
        format.html { redirect_to @want_list, notice: 'Want list was successfully created.' }
        format.json { render :show, status: :created, location: @want_list }
      else
        format.html { render :new }
        format.json { render json: @want_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /want_lists/1
  # PATCH/PUT /want_lists/1.json
  def update
    respond_to do |format|
      if @want_list.update(want_list_params)
        format.html { redirect_to @want_list, notice: 'Want list was successfully updated.' }
        format.json { render :show, status: :ok, location: @want_list }
      else
        format.html { render :edit }
        format.json { render json: @want_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /want_lists/1
  # DELETE /want_lists/1.json
  def destroy
    @want_list.destroy
    respond_to do |format|
      format.html { redirect_to want_lists_url, notice: 'Want list was successfully destroyed.' }
      format.json { head :no_content }
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
end
