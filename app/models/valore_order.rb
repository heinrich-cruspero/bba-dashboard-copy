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

  def self.search_status(status: nil, last_n_hours: nil, buyer_id: nil, offset: nil)
    valore_orders = ValoreOrder
                    .joins('INNER JOIN valore_accounts ON valore_orders.valore_account_id = valore_accounts.id')
                    .where('(valore_accounts.buyer_id = ? AND valore_orders.status IN (?) AND valore_orders.updated_at >= ?)',
                           buyer_id,
                           status,
                           (Time.now - last_n_hours.to_i.hours)).select('valore_orders.id, valore_orders.order_id, valore_orders.item_id, valore_orders.isbn, valore_orders.price, valore_orders.status')
    total = valore_orders.length
    valore_orders = valore_orders.limit(25)
    valore_orders = valore_orders.offset(offset) if offset.present?
    { record_returned_count: valore_orders.length, valore_orders: valore_orders, total: total }
  end
end
