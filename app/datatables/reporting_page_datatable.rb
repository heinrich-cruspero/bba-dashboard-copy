# frozen_string_literal: true

class ReportingPageDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :link_to
  def_delegator :@view, :reporting_page_path
  def_delegator :@view, :number_to_currency
  def_delegator :@view, :number_with_delimiter

  def view_columns
    @view_columns ||= {
      isbn: { source: 'ValoreOrder.isbn', cond: :eq },
      order_count: { source: 'ValoreOrder.order_count', searchable: false },
      max_price: { source: 'ValoreOrder.max_price', searchable: false },
      avg_price: { source: 'ValoreOrder.avg_price', searchable: false },
      title: { source: 'Book.title', searchable: false }
    }
  end

  private

  def data
    records.map do |valore_order|
      {
        isbn: valore_order.isbn,
        order_count: valore_order.order_count,
        max_price: valore_order.max_price,
        avg_price: valore_order.avg_price,
        title: valore_order.title
      }
    end
  end

  def get_raw_records(*)
    base_query = ValoreOrder.joins('JOIN "books" ON "valore_orders"."isbn" = "books"."ean"')
                            .select('valore_orders.isbn, count(valore_orders.order_id) AS order_count,
                   max(valore_orders.price) AS max_price, avg(valore_orders.price) AS avg_price, books.title')
    if params['data'].present?
      from_date = params['data']['from_date']
      to_date = params['data']['to_date']
      valore_account_ids = params['data']['valore_account_ids']
      base_query.where('valore_orders.valore_account_id IN (?)
                        AND valore_orders.created_at BETWEEN ? AND ?
                        AND valore_orders.status != ?',
                       valore_account_ids, from_date, to_date, 'rejected')
                .group('valore_orders.isbn, books.title')
    else
      base_query.where('valore_orders.status != ?', 'rejected')
                .group('valore_orders.isbn, books.title')
    end
  end
end
