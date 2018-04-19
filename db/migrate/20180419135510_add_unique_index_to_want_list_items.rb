class AddUniqueIndexToWantListItems < ActiveRecord::Migration[5.1]
  def change
    add_index :want_list_items, [:want_list_id, :ean], unique: true
  end
end
