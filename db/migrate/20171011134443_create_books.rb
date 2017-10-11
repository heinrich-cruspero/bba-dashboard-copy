class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :ean, null: false
      t.string :isbn, null: false

      t.timestamps
    end

    add_index :books, :ean, unique: true
    add_index :books, :isbn, unique: true
  end
end
