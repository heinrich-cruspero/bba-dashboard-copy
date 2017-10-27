class CreateIndabaOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :indaba_orders do |t|
      t.references :book, foreign_key: true, null: false, index: true
      t.references :indaba_instance, foreign_key: true, null: false, index: true
      t.float :price_paid, null: false, default: 0.00
      t.string :market_name, null: false, index: true
      t.string :buyer_email, null: false, index: true
      t.datetime :date_ordered, null: false, index: true

      t.timestamps
    end
  end
end
