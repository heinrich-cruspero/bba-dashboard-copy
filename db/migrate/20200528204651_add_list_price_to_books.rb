class AddListPriceToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :list_price, :float, null: false, default: 0.00
  end
end
