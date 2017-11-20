class AddColumnToWantListItems < ActiveRecord::Migration[5.1]
  def change
    add_column :want_list_items, :max_price, :float
  end
end
