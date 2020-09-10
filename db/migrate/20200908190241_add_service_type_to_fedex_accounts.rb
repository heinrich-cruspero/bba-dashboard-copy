class AddServiceTypeToFedexAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :fedex_accounts, :service_type, :integer, null: false, default: 0
    add_index :fedex_accounts, :service_type
  end
end
