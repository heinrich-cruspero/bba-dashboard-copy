class CreateRentalReturns < ActiveRecord::Migration[5.1]
  def change
    create_table :rental_returns do |t|
      t.references :fedex_account, foreign_key: true, null: false
      t.string :email, null: false
      t.string :name, null: false
      t.string :phone_number, null: false
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.text :response

      t.timestamps
    end
  end
end
