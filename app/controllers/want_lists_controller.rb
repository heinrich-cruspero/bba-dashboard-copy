class WantListsController < ApplicationController
  load_and_authorize_resource

  require 'csv'

  before_action :set_want_list, only: [:show, :edit, :update, :destroy, :items]

  after_action :upload_items, only: [:update, :create]

  # GET /want_lists
  def index
    # @want_lists = WantList.where('user_id=?', current_user.id)
    # self_want_lists = ActiveRecord::Base.connection.execute("SELECT want_list_id FROM users_want_lists WHERE user_id = #{current_user.id}").values
    # @self_want_lists = WantList.where("id IN (?)", self_want_lists.flatten)
    # @all_public_want_lists = WantList.where("want_list_privacy_id = ?", 1)
    respond_to do |format|
      format.html
      format.json { render json: WantListDatatable.new(view_context) }
    end
  end

  # GET /want_lists/1
  def show
  end

  # GET /want_lists/new
  def new
    @want_list = WantList.new
  end

  # GET /want_lists/1/edit
  def edit
  end

  def create
    # @want_list = WantList.new
    params[:privacy_list].to_i == 3 ? privacy_id = 3 : privacy_id = params[:privacy_list].to_i
    @want_list = WantList.new(:name=>params[:want_list][:name], :user_id=>current_user.id, :want_list_privacy_id =>privacy_id)
    respond_to do |format|
      if @want_list.save
        if privacy_id == 3
        params[:user_id].each do |k,v|
          if v.last.to_i == 1
            ActiveRecord::Base.connection.execute("INSERT INTO users_want_lists (want_list_id , user_id) VALUES (#{@want_list.id}, #{k.to_i})")
          end
          end
        end
        format.html { redirect_to @want_list, notice: 'Want list was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /want_lists/1
  def update
    # abort(@want_list.inspect)
    params[:edit_privacy_list].to_i == 3 ? privacy_id = 3 : privacy_id = params[:edit_privacy_list].to_i
    # @want_list = WantList.new(:name=>params[:want_list][:name], :user_id=>current_user.id, :want_list_privacy_id =>privacy_id)
    respond_to do |format|
      @want_list.want_list_privacy_id = privacy_id
      # if @want_list.save
      if @want_list.update(want_list_params)
        if privacy_id == 3
          ActiveRecord::Base.connection.execute("DELETE FROM users_want_lists WHERE want_list_id = #{@want_list.id}")
          params[:user_id].each do |k,v|
            if v.last.to_i == 1
              ActiveRecord::Base.connection.execute("INSERT INTO users_want_lists (want_list_id , user_id) VALUES (#{@want_list.id}, #{k.to_i})")
            end
            end
    # respond_to do |format|
        format.html { redirect_to :action => :index, notice: 'Want list was successfully updated.' }
          # redirect_to :action => :index, notice: 'Want list was successfully updated.'
        else
          format.html { redirect_to :action => :index, notice: 'Want list was successfully updated.' }
        # format.html { render :edit }
    # end
        end
        end
    end
  end

  # DELETE /want_lists/1
  def destroy
    # @want_list.destroy
    if @want_list.want_list_privacy_id == 3
        ActiveRecord::Base.connection.execute("DELETE FROM users_want_lists WHERE want_list_id = #{@want_list.id}")
        @want_list.destroy
    else
      @want_list.destroy
    end
    redirect_to :action => :index
  end

  # GET /items/1
  def items
    # @want_list_items = @want_list.want_list_items
    # respond_to do |format|
    #   format.html
    #   format.json { render json: WantListItemDatatable.new(view_context) }
    # end
  end

  def list_user
    # session[:permission_id] = params[:want_list_privacy_id]
    @users = User.all.uniq
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit_wantlist_user
    want_list_id = params[:want_list_id]
    selected_users = ActiveRecord::Base.connection.execute("SELECT * FROM users_want_lists WHERE want_list_id =#{want_list_id}")
    user_ids = []
    final_user_ids = []
    selected_users.each do |user|
    user_ids << user
    end
    user_ids.each do |entry|
      entry.each do |k,v|
        final_user_ids << v
        end
    end
    result = final_user_ids.delete_if { |item| item == want_list_id}
    @selected_users = User.where("id IN (?)", result)
    @remaining_users = User.where.not("id IN (?)", @selected_users.collect {|x| x.id})
    respond_to do |format|
      format.html
      format.js
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
