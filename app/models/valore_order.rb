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

  scope :accepted_or_rejected, ->(valore_account_id) {
    select(:isbn)
    where('(status IN (?) AND updated_at >= ? AND valore_account_id = ?)',
          %w[accepted rejected],
          (Time.now - 24.hours), valore_account_id)
  }
end
