class CreateValoreAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :valore_accounts do |t|
      t.string :name
      t.string :buyer_id
      t.string :access_key_id
      t.string :secret_access_key
      t.string :queue_url

      t.timestamps
    end
  end
end
