# frozen_string_literal: true

##
class AllWantListItemDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :link_to
  def_delegator :@view, :edit_want_list_item_path
  def_delegator :@view, :tooltip_field

  def view_columns
    @view_columns ||= {
      name: { source: 'WantList.name', cond: :eq, searchable: true, orderable: false },
      ean: { source: 'WantListItem.ean', cond: :eq, searchable: true, orderable: false },
      isbn: { source: 'Book.isbn', cond: :eq, searchable: true, orderable: true },
      quantity: { source: 'WantListItem.quantity', cond: :eq, searchable: false, orderable: true },
      quantity_purchased: { source: 'WantListItem.quantity_purchased', cond: :eq, searchable: false, orderable: true },
      max_price: { source: 'WantListItem.max_price', cond: :eq, searchable: false, orderable: true },
      author: { source: 'Book.author', cond: :like, searchable: true, orderable: true },
      title: { source: 'Book.title', cond: :like, searchable: true, orderable: true },
      publisher: { source: 'Book.publisher', cond: :like, searchable: true, orderable: true },
      edition: { source: 'Book.edition', cond: :like, searchable: true, orderable: true },
      list_price: { source: 'GuideData.list_price', cond: :like, searchable: false, orderable: true },
      percent_of_list: { source: 'GuideData.list_price', cond: :like, searchable: false, orderable: true }
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
        author: record.book.nil? ? '' : tooltip_field('author', record.book.id, record.book.author),
        title: record.book.nil? ? '' : tooltip_field('title', record.book.id, record.book.title),
        publisher: record.book.nil? ? '' : record.book.publisher,
        edition: record.book.nil? ? '' : record.book.edition,
        list_price: record.book.nil? ? '' : record.book.guide_datum.list_price,
        percent_of_list: record.book.nil? || record.book.guide_datum.nil? ? '' : record.book.guide_datum.list_price * 0.50,
        actions: "#{link_to('Edit', edit_want_list_item_path(record), method: :get, class: 'mdl-js-ripple-effect')}
          #{link_to('Delete', record, method: :delete, data: { confirm: 'Are you sure?' }) if @view.can? :destroy, record}".html_safe
      }
    end
  end

  private

  def get_raw_records(*)
    WantListItem.includes(:book).references(:book).all
                .includes(:want_list).references(:want_list).all
  end
end