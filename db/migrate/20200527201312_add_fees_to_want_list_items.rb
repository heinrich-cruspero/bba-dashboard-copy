class AddFeesToWantListItems < ActiveRecord::Migration[5.1]
  def change
    add_column :want_list_items, :fees, :float, null: false, default: 0.00
  end
end
