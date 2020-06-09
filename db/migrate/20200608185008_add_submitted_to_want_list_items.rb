class AddSubmittedToWantListItems < ActiveRecord::Migration[5.1]
  def change
    add_column :want_list_items, :submitted, :boolean, null: false, default: false
  end
end
