class CustomIsbnsController < ApplicationController
  load_and_authorize_resource

  before_action :set_custom_isbn, only: [:show, :edit, :update, :destroy]

  def index
    @custom_isbns = CustomIsbn.all
  end

  def show
  end

  def new
    @custom_isbn = CustomIsbn.new
  end

  def edit
  end

  def create
    @custom_isbn = CustomIsbn.new(custom_isbn_params)

    respond_to do |format|
      if @custom_isbn.save
        format.html { redirect_to @custom_isbn, notice: 'Custom isbn was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @custom_isbn.update(custom_isbn_params)
        format.html { redirect_to @custom_isbn, notice: 'Custom isbn was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @custom_isbn.destroy
    respond_to do |format|
      format.html { redirect_to custom_isbns_url, notice: 'Custom isbn was successfully destroyed.' }
    end
  end

  private
    def set_custom_isbn
      @custom_isbn = CustomIsbn.find(params[:id])
    end

    def custom_isbn_params
      params.require(:custom_isbn).permit(:text_isbn, :alt_isbn, :custom_isbn, :code_isbn, :tag)
    end
end
