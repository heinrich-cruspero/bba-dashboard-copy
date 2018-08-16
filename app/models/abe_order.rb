# frozen_string_literal: true

##
class AbeOrder < ApplicationRecord
  validates :order_id, :reference_id, presence: true

  has_many :abe_listings
  has_many :abe_order_items
end
