class CreateCustomIsbns < ActiveRecord::Migration[5.1]
  def change
    create_table :custom_isbns do |t|
      t.string :text_isbn, index: true
      t.string :alt_isbn, index: true
      t.string :custom_isbn, index: true
      t.string :code_isbn, index: true
      t.string :tag, index: true

      t.timestamps
    end
  end
end
