class CreateIndabaData < ActiveRecord::Migration[5.1]
  def change
    create_table :indaba_data do |t|
      t.references :book, foreign_key: true, index: { unique: true }
      t.float :bbap, null: false, default: 0.00
      t.float :direct, null: false, default: 0.00
      t.integer :tqs, null: false, default: 0
      t.integer :weekly_sqmd, null: false, default: 0
      t.integer :past_day_sales_history_quantity, null: false, default: 0
      t.integer :past_week_sales_history_quantity, null: false, default: 0
      t.integer :past_month_sales_history_quantity, null: false, default: 0
      t.integer :past_year_sales_history_quantity, null: false, default: 0

      t.string :first_lowest_price_indaba_name, null: false
      t.float :first_lowest_price_indaba_lowest_price, null: false, default: 0.00
      t.integer :first_lowest_price_indaba_quantity_online, null: false, default: 0

      t.string :second_lowest_price_indaba_name, null: false
      t.float :second_lowest_price_indaba_lowest_price, null: false, default: 0.00
      t.integer :second_lowest_price_indaba_quantity_online, null: false, default: 0

      t.string :third_lowest_price_indaba_name, null: false
      t.float :third_lowest_price_indaba_lowest_price, null: false, default: 0.00
      t.integer :third_lowest_price_indaba_quantity_online, null: false, default: 0

      t.string :forth_lowest_price_indaba_name, null: false
      t.float :forth_lowest_price_indaba_lowest_price, null: false, default: 0.00
      t.integer :forth_lowest_price_indaba_quantity_online, null: false, default: 0

      t.timestamps
    end
  end
end
