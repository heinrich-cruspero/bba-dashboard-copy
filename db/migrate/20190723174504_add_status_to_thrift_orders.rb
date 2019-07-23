class AddStatusToThriftOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :thrift_orders, :status, :string
  end
end
