class CreateEasyPostAccountsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :easy_post_accounts_users do |t|
      t.references :easy_post_account, index: true, null: false
      t.references :user, index: true, null: false
    end
  end
end
