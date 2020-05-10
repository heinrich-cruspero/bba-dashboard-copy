# frozen_string_literal: true

module Api
  module V1
    ##
    class ValoreOrdersController < Api::V1::BaseController
      def pending_orders
        render json: ValoreOrder.valore_pending_count
      end
    end
  end
end
