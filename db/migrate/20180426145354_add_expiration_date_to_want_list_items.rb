class AddExpirationDateToWantListItems < ActiveRecord::Migration[5.1]
  def change
    add_column :want_list_items, :expiration_date, :datetime
  end
end
