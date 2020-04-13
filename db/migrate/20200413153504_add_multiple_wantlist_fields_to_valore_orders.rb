class AddMultipleWantlistFieldsToValoreOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :valore_orders, :valore_want_list_id, :integer
  end
end
