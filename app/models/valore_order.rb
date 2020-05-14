# frozen_string_literal: true

##
class ValoreOrder < ApplicationRecord
  scope :valore_pending_count, lambda {
    select(:isbn).group(:isbn)
                 .where('(status IN (?) AND created_at >= ?) OR (status = ? AND created_at >= ?)',
                        ['pending', 'in-transit'],
                        (Time.now - 15.days),
                        'accepted',
                        (Time.now - 24.hours))
                 .count
  }
end
