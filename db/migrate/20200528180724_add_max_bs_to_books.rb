class AddMaxBsToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :max_bs, :float, null: false, default: 0.00
  end
end
