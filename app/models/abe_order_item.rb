# frozen_string_literal: true

##
class AbeOrderItem < ApplicationRecord
  validates :abe_listing, :abe_order, :cost, :shipcost, :status, :order_item_id, presence: true

  belongs_to :abe_listing
  belongs_to :abe_order
end
