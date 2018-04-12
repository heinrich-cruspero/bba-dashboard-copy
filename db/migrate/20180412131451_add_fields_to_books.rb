class AddFieldsToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :publisher, :string
    add_column :books, :edition, :string
  end
end
