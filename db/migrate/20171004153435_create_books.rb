class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :ean, null: false, index: { unique: true }
      t.string :isbn, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
