class CreateIndabaInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :indaba_instances do |t|
      t.references :book, null: false, foreign_key: true, index: true
      t.string :name, null: false, index: true
      t.integer :quantity_online, null: false, index: true, default:0
      t.float :lowest_price, null: false, index: true, default:0.00

      t.timestamps
    end
  end
end
