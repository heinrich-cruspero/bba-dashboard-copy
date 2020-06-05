class CreateJoinTableFedexAccountUser < ActiveRecord::Migration[5.1]
  def change
    create_table :fedex_accounts_users, id: false do |t|
      t.references :fedex_account, index: true, null: false
      t.references :user, index: true, null: false
    end
    add_foreign_key :fedex_accounts_users, :fedex_accounts
    add_foreign_key :fedex_accounts_users, :users
    add_index :fedex_accounts_users, [:fedex_account_id, :user_id], unique: true
  end
end
