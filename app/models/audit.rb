# frozen_string_literal: true

##
class Audit < ApplicationRecord
  belongs_to :tracked_sku, foreign_key: 'sku', primary_key: 'sku'
end
