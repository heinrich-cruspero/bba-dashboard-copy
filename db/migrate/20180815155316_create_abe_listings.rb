class CreateAbeListings < ActiveRecord::Migration[5.1]
  def change
    create_table :abe_listings do |t|
      t.references :abe_order, foreign_key: true, null: false, index: true
      t.string :listing_id, null: false, index: true
      t.integer :quantity, null: false
      t.string :title, null: false
      t.string :isbn, null: false, index: true
      t.integer :vendor_id, null: false, index: true
      t.integer :min_shipping_days, null: false
      t.integer :max_shipping_days, null: false

      t.timestamps
    end
  end
end
