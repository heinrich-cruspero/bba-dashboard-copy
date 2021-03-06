# frozen_string_literal: true

module Api
  module V1
    ##
    class ValoreOrdersController < Api::V1::BaseController
      def pending_orders
        render json: ValoreOrder.valore_pending_count
      end

      def search_status
        offset = params[:offset]
        buyer_id = params[:buyer_id]
        status = params[:status]
        last_n_hours = params[:last_n_hours]
        result = ValoreOrder.search_status(
          status: status, last_n_hours: last_n_hours, buyer_id: buyer_id,
          offset: offset
        )
        render json: result
      end
    end
  end
end
