class CreateThriftOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :thrift_orders do |t|
      t.string :cart_id
      t.string :external_order_id
      t.references :want_list, foreign_key: true

      t.timestamps
    end
  end
end
