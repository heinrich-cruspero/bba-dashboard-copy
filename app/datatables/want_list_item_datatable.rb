class WantListItemDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :link_to
  def_delegator :@view, :edit_want_list_item_path

  def view_columns
    @view_columns ||= {
        ean: { source: "WantListItem.ean", cond: :eq, searchable: true, orderable: false },
        quantity: { source: "WantListItem.quantity", cond: :eq, searchable: false, orderable: true },
        max_price: { source: "WantListItem.max_price", cond: :eq, searchable: false, orderable: true },
        author: { source: "Book.author", cond: :like, searchable: true, orderable: true },
        title: { source: "Book.title", cond: :like, searchable: true, orderable: true },
    }
  end

  def data
    records.map do |record|
      {
        ean: record.ean,
        quantity: record.quantity,
        max_price: record.max_price,
        author: record.book.nil? ? '' : record.book.author,
        title: record.book.nil? ? '' : record.book.title,
        actions: link_to("Edit", edit_want_list_item_path(record), method: :get, class: "mdl-js-ripple-effect") + ' ' +
                 link_to("Delete", record, method: :delete, data: { confirm: 'Are you sure?' }, class: "mdl-js-ripple-ef")
      }
    end
  end

  private
  def get_raw_records()
    WantListItem.where("want_list_id = #{options[:want_list_id]}")
        .includes(:book).references(:book).all
  end
end
