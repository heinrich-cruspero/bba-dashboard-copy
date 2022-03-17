# frozen_string_literal: true

##
class TrackedSkusController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json { render json: TrackedSkuDatatable.new(params, view_context: view_context) }
    end
  end
end
