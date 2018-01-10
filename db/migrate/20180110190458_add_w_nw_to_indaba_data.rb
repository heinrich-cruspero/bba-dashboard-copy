class AddWNwToIndabaData < ActiveRecord::Migration[5.1]
  def change
    add_column :indaba_data, :w_nw, :float, null: false, default: 0.00
  end
end
