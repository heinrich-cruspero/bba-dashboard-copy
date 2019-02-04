
class CreateAudits < ActiveRecord::Migration[5.1]
  def change
    create_table :audits do |t|
      t.string :sku, null: false, index: true
      t.boolean :status, null: false, default: false
      t.text :notes
      t.float :internal_price_1, null: false, default: 0.00
      t.float :internal_price_2, null: false, default: 0.00
      t.float :internal_price_3, null: false, default: 0.00
      t.float :internal_price_4, null: false, default: 0.00
      t.date :date_created

      t.timestamps
    end
  end
end
