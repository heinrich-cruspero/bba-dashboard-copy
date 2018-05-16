class CreateValoreOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :valore_orders do |t|
      t.integer :order_id
      t.integer :item_id
      t.string :isbn
      t.float :price
      t.datetime :quote_date
      t.string :status

      t.timestamps
    end
  end
end
