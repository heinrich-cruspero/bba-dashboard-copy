class CreateWantListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :want_list_items do |t|
      t.references :want_list, foreign_key: true
      t.string :isbn
      t.integer :quantity

      t.timestamps
    end
  end
end
