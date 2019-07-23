# frozen_string_literal: true

##
class TrackedSku < ApplicationRecord
  belongs_to :audit, foreign_key: 'sku', primary_key: 'sku', optional: true
end
