# frozen_string_literal: true

##
class ReportingPagesController < ApplicationController
  def index
    authorize! :index, ReportingPagesController

    @valore_accounts = ValoreAccount.all.select(:id, :name)
    params.permit!
    respond_to do |format|
      @data = params[:data]
      format.html
      format.json { render json: ReportingPageDatatable.new(view_context, params: params) }
    end
  end
end
