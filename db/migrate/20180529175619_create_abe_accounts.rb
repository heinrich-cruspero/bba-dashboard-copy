class CreateAbeAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :abe_accounts do |t|
      t.string :email
      t.string :client_key
      t.string :access_key
      t.string :secret_key
      t.string :cc_token

      t.timestamps
    end
  end
end
