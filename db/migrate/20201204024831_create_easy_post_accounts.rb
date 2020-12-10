class CreateEasyPostAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :easy_post_accounts, id: :integer do |t|
      t.string :key, null: false
      t.string :account_number, null: false
      t.string :name, null: false
      t.string :company_name, null: false
      t.string :phone_number, null: false
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.string :country, null: false
      t.boolean :prod, default: false
      t.float   :parcel_width, null: false
      t.float   :parcel_length, null: false
      t.float   :parcel_height, null: false
      t.float   :parcel_weight, null: false
      t.timestamps
    end
  end
end
