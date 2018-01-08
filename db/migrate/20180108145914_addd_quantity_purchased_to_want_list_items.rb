class AdddQuantityPurchasedToWantListItems < ActiveRecord::Migration[5.1]
  def change
    add_column :want_list_items, :quantity_purchased, :int, null: false, default: 0
    change_column :want_list_items, :max_price, :float, null: false, default: 0.00
  end
end
