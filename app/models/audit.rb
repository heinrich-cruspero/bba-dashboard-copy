# frozen_string_literal: true

##
class Audit < ApplicationRecord
  validates :status, inclusion: { in: [true, false] }
  validates :sku, :internal_price_1, :internal_price_2,
            :internal_price_3, :internal_price_4, :date_created, presence: true

  belongs_to :tracked_sku, foreign_key: 'sku', primary_key: 'sku', optional: true
end
