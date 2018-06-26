class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.references :source, foreign_key: true, null: false
      t.string :name, null: false, index: true
      t.string :account_number, null: false, index: true
      t.string :address_ln1, null: false, index: true
      t.string :address_ln2
      t.string :city, null: false, index: true
      t.string :state, null: false, index: true
      t.string :zip, null: false, index: true
      t.string :phone_number, index: true
      t.string :extension

      t.timestamps
    end

    add_index :accounts, [:source_id, :name], unique: true
  end
end
