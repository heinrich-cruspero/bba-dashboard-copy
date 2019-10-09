class CreateFedexAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :fedex_accounts do |t|
      t.string :key, null: false
      t.string :password, null: false
      t.string :account_number, null: false
      t.string :meter_number, null: false
      t.string :name, null: false
      t.string :company_name, null: false
      t.string :phone_number, null: false
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false

      t.timestamps
    end
  end
end
