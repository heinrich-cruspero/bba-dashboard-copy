class AddMultipleWantlistFieldsToWantlists < ActiveRecord::Migration[5.1]
  def change
    add_column :want_lists, :valore_want_list_id, :integer
    add_column :want_lists, :valore_po_number, :string
    add_column :want_lists, :valore_shipment_date, :date
    add_column :want_lists, :valore_shipment_frequency, :string
  end
end
