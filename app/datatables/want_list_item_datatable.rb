class WantListItemDatatable < AjaxDatatablesRails::Base

  def_delegator :@view, :link_to
  def_delegator :@view, :edit_want_list_item_path
  def_delegator :@view, :button_to

  def view_columns
    @view_columns ||= {
        ean: { source: "WantListItem.ean", cond: :eq, searchable: true, orderable: false },
        quantity: { source: "WantListItem.quantity", cond: :eq, searchable: true, orderable: true },
        max_price: { source: "WantListItem.max_price", cond: :eq, searchable: true, orderable: true },
        author: { source: "Book.author", cond: :eq, searchable: true, orderable: false },
        title: { source: "Book.title", cond: :eq, searchable: true, orderable: false },
    }
  end

  def data
    records.map do |record|
      {
        ean: record.ean,
        quantity: record.quantity,
        max_price: record.max_price,
        author: record.book.author,
        title: record.book.title,
        edit: button_to("edit", edit_want_list_item_path(record), method: :get, class: "mdl-js-ripple-effect"),
        show: button_to("Show", record, method: :get, class: "mdl-js-ripple-effect"),
        delete: button_to("Delete", record, method: :delete, data: { confirm: 'Are you sure?' }, class: "mdl-js-ripple-ef")
      }
    end
  end

  private
  def get_raw_records()
    WantListItem.where("want_list_id = #{params[:want_list_id]}")
        .includes(:book).references(:book).all
  end
end
