class CreateIndabaOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :indaba_orders do |t|
      t.references :book, foreign_key: true, null: false, index: true
      t.references :indaba_instance, foreign_key: true, null: false, index: true
      t.float :price_paid, null: false, default: 0.00
      t.string :market_name, null: false, index: true
      t.string :buyer_email, null: true, index: true
      t.string :market_book_order_id, null: false, index: true
      t.datetime :date_ordered, null: false, index: true

      t.timestamps
    end

    add_index :indaba_orders, [:indaba_instance_id, :market_book_order_id], unique: true, name: 'index_indaba_orders_on_indaba_instance_and_market_book_order'
  end
end
