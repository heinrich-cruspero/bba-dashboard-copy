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
      format.json { render json: ReportingPageDatatable.new(params) }

      format.csv do
        CsvDownloadJob.perform_later(params.to_h, 'ReportingPageDatatable', 'valore_orders.csv',
                                   current_user.id)
        head :ok
      end
    end
  end
end
