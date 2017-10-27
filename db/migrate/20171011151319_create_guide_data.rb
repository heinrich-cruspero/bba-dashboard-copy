class CreateGuideData < ActiveRecord::Migration[5.1]
  def change
    create_table :guide_data do |t|
      t.references :book, foreign_key: true, null: false, index: { unique: true }
      t.float :list_price, null: false, default: 0.00

      t.timestamps
    end
  end
end
