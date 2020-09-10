# frozen_string_literal: true

##
class BooksController < ApplicationController
  load_and_authorize_resource

  before_action :check_permission, only: [:index]
  before_action :set_book, only: [:details]
  before_action :import_book, only: [:index]

  # GET /books
  def index
    respond_to do |format|
      format.html
      format.json { render json: BookDatatable.new(params, view_context: view_context) }
    end
  end

  # GET /books/1/details
  def details
    render partial: 'details', layout: false
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params
    params.require(:book).permit
  end

  def import_book
    return if params[:search].nil?

    val = params[:search][:value]

    val_length = val.length

    case val_length
    when 10
      book = Book.find_by_isbn(val)
      field = 'isbn'
    when 13
      book = Book.find_by_ean(val)
      field = 'ean'
    else
      return
    end

    return unless book.nil?

    result = DataWhApiService.new.get_book(field, val)
    Book.create_from_data_wh_result(result) unless result.empty?
  end

  def check_permission
    redirect_to rental_returns_path if current_user.warehouse?
  end
end
