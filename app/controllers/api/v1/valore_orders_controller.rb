# frozen_string_literal: true

module Api
  module V1
    ##
    class ValoreOrdersController < Api::V1::BaseController
      def pending_orders
        render json: ValoreOrder.valore_pending_count
      end

      def search
        valore_account_id = params[:valore_account_id]
        status = params[:status]
        last_n_hours = params[:last_n_hours]
        result = ValoreOrder.search(status: status, last_n_hours: last_n_hours, valore_account_id: valore_account_id)
        render json: result
      end
    end
  end
end
