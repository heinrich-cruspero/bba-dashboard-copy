# frozen_string_literal: true

##
class BooksController < ApplicationController
  load_and_authorize_resource

  before_action :set_book, only: [:details]

  # GET /books
  def index
    respond_to do |format|
      format.html
      format.json {
        search_length = params[:search][:value].length
        if [10,13].include? params[:search][:value].length
          case search_length
          when 10
            result = Book.find_by_isbn(params[:search][:value])
          when 13
            result = Book.find_by_ean(params[:search][:value])
          end

          if result.nil?
            Book.create(ean: '1111111111111', isbn: '1111111111', author: '', title: '')
          end
        end
        render json: BookDatatable.new(view_context)
      }
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
end
