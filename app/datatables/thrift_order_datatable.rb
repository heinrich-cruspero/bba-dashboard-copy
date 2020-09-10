# frozen_string_literal: true

##
class ThriftOrderDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegator :@view, :link_to
  def_delegator :@view, :items_thrift_order_url
  def_delegator :@view, :items_want_list_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      external_order_id: { source: 'ThriftOrder.external_order_id', cond: :like, searchable: true, orderable: true },
      want_list: { source: 'WantList.name', cond: :like, searchable: true, orderable: true },
      status: { source: 'ThriftOrder.status', cond: :like, searchable: true, orderable: true },
      created_at: { source: 'ThriftOrder.created_at', cond: :like, searchable: true, orderable: true },
      updated_at: { source: 'ThriftOrder.updated_at', cond: :like, searchable: true, orderable: true }
    }
  end

  private

  def data
    records.map do |thrift_order|
      {
        external_order_id: thrift_order.external_order_id,
        want_list: link_to(thrift_order.want_list.name, items_want_list_path(thrift_order.want_list_id)).to_s.html_safe,
        status: thrift_order.status,
        created_at: thrift_order.created_at.in_time_zone('Central Time (US & Canada)').strftime('%m-%d-%Y %H:%M'),
        updated_at: thrift_order.updated_at.in_time_zone('Central Time (US & Canada)').strftime('%m-%d-%Y %H:%M'),
        actions: link_to('Items', items_thrift_order_url(thrift_order)).to_s.html_safe
      }
    end
  end

  def get_raw_records(*)
    ThriftOrder.includes(:want_list).references(:want_list).all
  end
end
