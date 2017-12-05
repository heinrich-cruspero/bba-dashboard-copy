class WantListItemDatatable < AjaxDatatablesRails::Base

  def_delegator :@view, :link_to
  def_delegator :@view, :edit_want_list_item_path
  def_delegator :@view, :want_list_item_path
  def_delegator :@view, :button_to

  def view_columns
    @view_columns ||= {
        ean: { source: "WantListItem.ean", cond: :like, searchable: true, orderable: false },
        quantity: { source: "WantListItem.quantity", cond: :like, searchable: true, orderable: true },
        max_price: { source: "WantListItem.max_price", cond: :like, searchable: true, orderable: true },
    }
  end

  def data
    records.map do |want_list_item|
      {
        ean: want_list_item.ean,
        quantity: want_list_item.quantity,
        max_price: want_list_item.max_price,
        edit: button_to("edit", edit_want_list_item_path(want_list_item), method: :get, class: "mdl-js-ripple-effect"),
        show: button_to("Show", want_list_item, method: :get, class: "mdl-js-ripple-effect"),
        delete: button_to("Delete", want_list_item, method: :delete, data: { confirm: 'Are you sure?' }, class: "mdl-js-ripple-ef")
      }
    end
  end

  private

  def get_raw_records
    WantListItem.all
  end

  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end
