class CreateThriftOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :thrift_order_items do |t|
      t.references :thrift_order, foreign_key: true
      t.string :sku
      t.string :status

      t.timestamps
    end
  end
end
