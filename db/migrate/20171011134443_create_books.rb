class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :ean, index: true, null: false
      t.string :isbn, index: true, null: false

      t.timestamps
    end
  end
end
