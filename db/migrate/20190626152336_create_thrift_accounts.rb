class CreateThriftAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :thrift_accounts do |t|
      t.string :name
      t.string :token
      t.string :address_id

      t.timestamps
    end
  end
end
