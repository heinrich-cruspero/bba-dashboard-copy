class CreateWantListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :want_list_items do |t|
      t.references :want_list, foreign_key: true, null: false
      t.string :ean, null: false, index: true
      t.integer :quantity, null: false, default: 0

      t.timestamps
    end
  end
end
