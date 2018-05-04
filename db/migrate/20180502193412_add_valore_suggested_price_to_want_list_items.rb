class AddValoreSuggestedPriceToWantListItems < ActiveRecord::Migration[5.1]
  def change
    add_column :want_list_items, :valore_suggested_price, :float, null: false, default: 0.00
  end
end
