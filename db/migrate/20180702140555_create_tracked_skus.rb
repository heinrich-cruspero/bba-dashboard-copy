class CreateTrackedSkus < ActiveRecord::Migration[5.1]
  def change
    create_table :tracked_skus do |t|
      t.string :asin
      t.string :isbn
      t.date :publication_date
      t.string :title
      t.string :author
      t.string :publisher
      t.string :binding
      t.string :condition
      t.string :location
      t.string :sku
      t.string :locator_code
      t.string :suffix
      t.datetime :date_created
      t.string :internal_price_4
      t.string :internal_notes_1
      t.string :internal_notes_2
      t.string :internal_notes_3
      t.boolean :audited

      t.timestamps
    end
  end
end
