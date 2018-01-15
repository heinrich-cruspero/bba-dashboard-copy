class AddTotalQuantityToIndabaInstanceData < ActiveRecord::Migration[5.1]
  def change
    add_column :indaba_instance_data, :total_quantity, :int, null: false, default: 0
  end
end
