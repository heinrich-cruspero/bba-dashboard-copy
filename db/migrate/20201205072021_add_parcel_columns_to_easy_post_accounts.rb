class AddParcelColumnsToEasyPostAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :easy_post_accounts, :parcel_width, :float
    add_column :easy_post_accounts, :parcel_length, :float
    add_column :easy_post_accounts, :parcel_height, :float
    add_column :easy_post_accounts, :parcel_weight, :float
  end
end
