class CreateIndabaInstanceData < ActiveRecord::Migration[5.1]
  def change
    create_table :indaba_instance_data do |t|
      t.references :indaba_instance, foreign_key: true, null: false, index: true
      t.references :book, foreign_key: true, null: false, index: true
      t.integer :quantity_online, null: false, default: 0
      t.float :lowest_price, null: false, default: 0.00

      t.timestamps
    end

    add_index :indaba_instance_data, [:indaba_instance_id, :book_id], unique: true
  end
end
