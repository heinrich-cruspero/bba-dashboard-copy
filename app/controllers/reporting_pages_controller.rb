# frozen_string_literal: true

##
class ReportingPagesController < ApplicationController
  # load_and_authorize_resource

  def index
    @valore_accounts = ValoreAccount.all.select(:id, :name)
    params.permit!
    respond_to do |format|
      @data = params[:data]
      format.html
      format.json { render json: ReportingPageDatatable.new(view_context, params: params) }
    end
  end
end
