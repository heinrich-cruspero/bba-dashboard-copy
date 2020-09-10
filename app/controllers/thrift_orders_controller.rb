# frozen_string_literal: true

##
class ThriftOrdersController < ApplicationController
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html
      format.json { render json: ThriftOrderDatatable.new(params, view_context: view_context)  }
    end
  end

  def items
    respond_to do |format|
      format.html
      format.json { render json: ThriftOrderItemDatatable.new(view_context) }
    end
  end
end
