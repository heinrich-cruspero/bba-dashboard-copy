# frozen_string_literal: true

##
class AbeListing < ApplicationRecord
  validates :abe_order, :listing_id, :quantity, :title, :isbn, :vendor_id, :min_shipping_days, :max_shipping_days, presence: true

  belongs_to :abe_order
  has_many :abe_order_items
end
