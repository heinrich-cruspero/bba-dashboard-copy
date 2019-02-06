
class CreateAudits < ActiveRecord::Migration[5.1]
  def change
    create_table :audits do |t|
      t.string :sku, null: false, index: true
      t.boolean :status, null: false, default: false
      t.text :notes
      t.float :internal_price_4
      t.string :internal_notes_1
      t.string :internal_notes_2
      t.string :internal_notes_3
      t.date :date_created

      t.timestamps
    end
  end
end
