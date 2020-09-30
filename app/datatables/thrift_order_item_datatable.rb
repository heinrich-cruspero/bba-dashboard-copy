# frozen_string_literal: true

##
class ThriftOrderItemDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegator :@view, :link_to

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      sku: { source: 'ThriftOrderItem.sku', cond: :like, searchable: true, orderable: true },
      asin: { source: 'ThriftOrderItem.asin', cond: :like, searchable: true, orderable: true },
      price: { source: 'ThriftOrderItem.price', cond: :like, searchable: true, orderable: true },
      condition: { source: 'ThriftOrderItem.condition', cond: :like, searchable: true, orderable: true },
      status: { source: 'ThriftOrderItem.status', cond: :like, searchable: true, orderable: true },
      tracking_url: { source: 'ThriftOrderItem.tracking_url', cond: :like, searchable: true, orderable: true }
    }
  end

  private

  def data
    records.map do |thrift_order_item|
      {
        sku: thrift_order_item.sku,
        asin: thrift_order_item.asin,
        price: thrift_order_item.price,
        condition: thrift_order_item.condition,
        status: thrift_order_item.status,
        tracking_url: thrift_order_item.tracking_url.empty? ? '' : link_to('Tracking', thrift_order_item.tracking_url, target: :_blank).to_s.html_safe
      }
    end
  end

  def get_raw_records(*)
    ThriftOrderItem.all
  end
end
