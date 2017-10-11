class CreateIndabaData < ActiveRecord::Migration[5.1]
  def change
    create_table :indaba_data do |t|
      t.references :book, foreign_key: true, index: { unique: true }
      t.float :bbap, null: false, default: 0.00
      t.float :direct, null: false, default: 0.00
      t.integer :tqs, null: false, default: 0
      t.integer :weekly_sqad, null: false, default: 0
      t.integer :weekly_sqmd, null: false, default: 0
      t.float :past_day_sales_history_lowest_price, null: false, default: 0.00
      t.float :past_day_sales_history_highest_price, null: false, default: 0.00
      t.float :past_week_sales_history_lowest_price, null: false, default: 0.00
      t.float :past_week_sales_history_highest_price, null: false, default: 0.00
      t.float :past_month_sales_history_lowest_price, null: false, default: 0.00
      t.float :past_month_sales_history_highest_price, null: false, default: 0.00

      t.timestamps
    end
  end
end
