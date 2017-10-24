class CreateFbazData < ActiveRecord::Migration[5.1]
  def change
    create_table :fbaz_data do |t|
      t.references :book, foreign_key: true, index: true
      t.float :price, null: false, default: 0.00
      t.string :market, null: false

      t.timestamps
    end
  end
end
