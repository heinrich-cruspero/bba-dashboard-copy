class AddWholeSaleToIndabaData < ActiveRecord::Migration[5.1]
  def change
    add_column :indaba_data, :whole_sale, :float, null: false, default: 0.00
  end
end
