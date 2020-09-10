# frozen_string_literal: true

##
class TrackedSkusController < ApplicationController
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html
      format.json { render json: TrackedSkuDatatable.new(params, view_context: view_context)  }
    end
  end
end
