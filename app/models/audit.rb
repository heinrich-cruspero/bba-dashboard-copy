# frozen_string_literal: true

##
class Audit < ApplicationRecord
  validates :status, inclusion: { in: [true, false] }
  validates :sku, presence: true

  belongs_to :tracked_sku, foreign_key: 'sku', primary_key: 'sku', optional: true
end
