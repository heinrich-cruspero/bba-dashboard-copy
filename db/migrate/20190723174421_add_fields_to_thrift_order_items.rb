class AddFieldsToThriftOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :thrift_order_items, :asin, :string
    add_column :thrift_order_items, :price, :float
    add_column :thrift_order_items, :condition, :string
    add_column :thrift_order_items, :tracking_url, :string
  end
end
