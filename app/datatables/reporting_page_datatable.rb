# frozen_string_literal: true

class ReportingPageDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :reporting_page_path
  def_delegator :@view, :tooltip_field

  def view_columns
    @view_columns ||= {
      isbn: { source: 'ValoreOrder.isbn', cond: :eq, searchable: true, sortable: false },
      order_count: { source: 'order_count', searchable: false, orderable: true },
      max_price: { source: 'max_price', searchable: false, orderable: true },
      avg_price: { source: 'avg_price', searchable: false, orderable: true },
      author: { source: 'author', searchable: false, orderable: true },
      title: { source: 'title', searchable: false, orderable: true },
      publisher: { source: 'publisher', searchable: false, orderable: true },
      publication_date: { source: 'publication_date', searchable: false, orderable: true },
      edition: { source: 'edition', searchable: false, orderable: true },
      list_price: { source: 'list_price', searchable: false, orderable: true }
    }
  end

  def data
    records.map do |valore_order|
      {
        isbn: valore_order.isbn,
        order_count: valore_order.order_count,
        max_price: valore_order.max_price,
        avg_price: valore_order.avg_price,
        author: valore_order.author.nil? ? '' : tooltip_field('author', valore_order.isbn, valore_order.author),
        title: valore_order.title.nil? ? '' : tooltip_field('title', valore_order.isbn, valore_order.title),
        publisher: valore_order.publisher.nil? ? '' : valore_order.publisher,
        publication_date: valore_order.publication_date.nil? ? '' : valore_order.publication_date,
        edition: valore_order.edition.nil? ? '' : valore_order.edition,
        list_price: valore_order.list_price.nil? ? '' : valore_order.list_price
      }
    end
  end

  def as_json(*)
    {
      draw: params[:draw].to_i,
      recordsTotal: get_raw_records.length,
      recordsFiltered: filter_records(get_raw_records).length,
      data: data
    }
  end

  def get_raw_records(*)
    base_query = ValoreOrder.joins('JOIN "books" ON "valore_orders"."isbn" = "books"."ean"')
                            .select('valore_orders.isbn, count(valore_orders.order_id) AS order_count,
                            max(valore_orders.price) AS max_price, ROUND(AVG(valore_orders.price)::numeric,2) AS avg_price,
                            books.author,  books.title, books.publisher, books.publication_date,
                            books.edition, books.list_price')
    if params['data'].present?
      from_date = params['data']['from_date']
      to_date = params['data']['to_date']
      valore_account_ids = params['data']['valore_account_ids']
      if valore_account_ids.present? && from_date.present? && to_date.present?
        base_query.where('valore_orders.valore_account_id IN (?)
                          AND valore_orders.created_at BETWEEN ? AND ?
                          AND valore_orders.status != ?',
                         valore_account_ids, from_date, to_date, 'rejected')
                  .group('valore_orders.isbn, books.author, books.title, books.publisher,
                          books.publication_date, books.edition, books.list_price')
      elsif valore_account_ids.present?
        base_query.where('valore_orders.valore_account_id IN (?)
                        AND valore_orders.status != ?',
                         valore_account_ids, 'rejected')
                  .group('valore_orders.isbn, books.author, books.title, books.publisher,
                        books.publication_date, books.edition, books.list_price')
      elsif from_date.present? && to_date.present?
        base_query.where('valore_orders.created_at BETWEEN ? AND ?
                        AND valore_orders.status != ?',
                         from_date, to_date, 'rejected')
                  .group('valore_orders.isbn, books.author, books.title, books.publisher,
                        books.publication_date, books.edition, books.list_price')
      end
    else
      base_query.where('valore_orders.status != ?', 'rejected')
                .group('valore_orders.isbn, books.author, books.title, books.publisher,
                       books.publication_date, books.edition, books.list_price')
    end
  end
end
