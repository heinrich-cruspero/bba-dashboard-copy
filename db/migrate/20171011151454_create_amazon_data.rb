class CreateAmazonData < ActiveRecord::Migration[5.1]
  def change
    create_table :amazon_data do |t|
      t.references :book, foreign_key: true, null: false, index: { unique: true }
      t.float :lowest_fba, null: false, default: 0.00
      t.float :lowest_good_price, null: false, default: 0.00
      t.integer :sales_rank, null: false, default: 0

      t.timestamps
    end
  end
end
