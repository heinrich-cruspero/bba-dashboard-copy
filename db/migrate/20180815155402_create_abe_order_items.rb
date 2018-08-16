class CreateAbeOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :abe_order_items do |t|
      t.references :abe_listing, foreign_key: true, null: false, index: true
      t.references :abe_order, foreign_key: true, null: false, index: true
      t.float :cost, null: false
      t.float :shipcost, null: false
      t.integer :status, null: false, index: true
      t.integer :order_item_id, null: false, index: true

      t.timestamps
    end
  end
end
