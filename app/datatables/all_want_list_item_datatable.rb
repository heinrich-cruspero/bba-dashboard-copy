# frozen_string_literal: true

##
class AllWantListItemDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegator :@view, :link_to
  def_delegator :@view, :edit_want_list_item_path
  def_delegator :@view, :want_list_item_path
  # def_delegator :@view, :tooltip_field

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      name: { source: 'WantList.name', cond: :like, searchable: true, orderable: false },
      ean: { source: 'WantListItem.ean', cond: :like, searchable: true, orderable: false },
      isbn: { source: 'Book.isbn', cond: :like, searchable: true, orderable: true },
      quantity: { source: 'WantListItem.quantity', cond: :eq, searchable: false, orderable: true },
      quantity_purchased: { source: 'WantListItem.quantity_purchased', cond: :eq, searchable: false, orderable: true },
      max_price: { source: 'WantListItem.max_price', cond: :eq, searchable: false, orderable: true },
      author: { source: 'Book.author', cond: :like, searchable: true, orderable: true },
      title: { source: 'Book.title', cond: :like, searchable: true, orderable: true },
      publisher: { source: 'Book.publisher', cond: :like, searchable: true, orderable: true },
      edition: { source: 'Book.edition', cond: :like, searchable: true, orderable: true },
      list_price: { source: 'Book.list_price', cond: :like, searchable: false, orderable: true },
      percent_of_list: { source: 'Book.list_price', cond: :like, searchable: false, orderable: true },
      max_bs: { source: 'Book.max_bs', cond: :eq, searchable: false, orderable: true }
    }
  end

  def data
    records.map do |record|
      {
        name: record.want_list.name,
        ean: record.ean,
        isbn: record.book.nil? ? '' : record.book.isbn,
        quantity: record.quantity,
        quantity_purchased: record.quantity_purchased,
        max_price: record.max_price,
        author: record.book.nil? ? '' : record.book.author, #tooltip_field('author', record.book.id, record.book.author),
        title: record.book.nil? ? '' : record.book.title, #tooltip_field('title', record.book.id, record.book.title),
        publisher: record.book.nil? ? '' : record.book.publisher,
        edition: record.book.nil? ? '' : record.book.edition,
        list_price: record.book.nil? ? '' : record.book.list_price,
        percent_of_list: record.book.nil? ? '' : record.book.list_price * 0.50,
        max_bs: record.book.nil? ? '' : record.book.max_bs,
        actions: "#{link_to('Edit', edit_want_list_item_path(record))} |
                  #{link_to('Delete', want_list_item_path(record), method: :delete, data: { turbo_method: :delete, turbo_confirm: 'Are you sure?' })}".html_safe
      }
    end
  end

  private

  def get_raw_records(*)
    WantListItem.includes(:book).references(:book).all
                .includes(:want_list).references(:want_list).all
  end
end
