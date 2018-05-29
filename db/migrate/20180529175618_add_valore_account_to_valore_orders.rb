class AddValoreAccountToValoreOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :valore_orders, :valore_account, foreign_key: true
  end
end
