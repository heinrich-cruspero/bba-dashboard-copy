# frozen_string_literal: true

module Api
  module V1
    ##
    class ValoreOrdersController < Api::V1::BaseController
      def pending_orders
        valore_orders = ValoreOrder.select(:isbn).group(:isbn).where(status: ['pending', 'in-transit', 'accepted']).count
        render json: valore_orders
      end
    end
  end
end
