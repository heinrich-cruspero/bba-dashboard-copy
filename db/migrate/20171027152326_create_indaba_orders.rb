class CreateIndabaOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :indaba_orders do |t|
      t.references :book, foreign_key: true
      t.string :indaba_name
      t.float :price_paid
      t.string :market_name
      t.string :buyer_email

      t.timestamps
    end
  end
end
