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

  def self.search_status(status: nil, last_n_hours: nil, valore_account_id: nil, limit: nil, offset: nil)
    valore_orders = select(:id, :order_id, :item_id, :isbn, :status, :created_at, :updated_at)
      .where('(status IN (?) AND updated_at >= ? AND valore_account_id = ?)',
             status,
             (Time.now - last_n_hours.to_i.hours),
             valore_account_id)
    total = valore_orders.length
    if limit.present? || offset.present?
      valore_orders = valore_orders.limit(limit).offset(offset)
    end
    {total: total, valore_orders: valore_orders}
  end
end
