# frozen_string_literal: true

##
class BooksController < ApplicationController
  load_and_authorize_resource

  before_action :set_book, only: [:details]
  before_action :import_book, only: [:index]

  # GET /books
  def index
    respond_to do |format|
      format.html
      format.json { render json: BookDatatable.new(view_context) }
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

    return if result.empty?

    Book.create(ean: result[0]['ean'], isbn: result[0]['isbn'],
                author: result[0]['author'], title: result[0]['title'],
                publisher:  result[0]['publisher'], edition: result[0]['edition'],
                publication_date: result[0]['publication_date'])
  end
end
