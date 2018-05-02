class AddValoreSuggestedPriceToWantListItems < ActiveRecord::Migration[5.1]
  def change
    add_column :want_list_items, :valore_suggested_price, :float
  end
end
