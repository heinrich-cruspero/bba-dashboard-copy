class AddVendorIdsToAbeAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :abe_accounts, :vendor_ids, :text
  end
end
