# frozen_string_literal: true

##
class ValoreOrder < ApplicationRecord

    scope :valore_pending_count, -> {
      select(:isbn).group(:isbn)
      .where(status: ['pending', 'in-transit'])
      .where("created_at >= ?", (Time.now - 15.days))
      .or(ValoreOrder.select(:isbn).group(:isbn).where(status: ['accepted'])
      .where("created_at >= ?", (Time.now - 24.hours)))
      .count
    }

end
