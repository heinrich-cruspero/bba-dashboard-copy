class AddMediaPartnerIdToAbeAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :abe_accounts, :media_partner_id, :integer
  end
end
