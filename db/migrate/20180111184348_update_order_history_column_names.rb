class UpdateOrderHistoryColumnNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :indaba_data, :past_day_sales_history_quantity, :daily_sqaa
    rename_column :indaba_data, :past_week_sales_history_quantity, :weekly_sqaa
    rename_column :indaba_data, :past_month_sales_history_quantity, :monthly_sqaa
    rename_column :indaba_data, :past_year_sales_history_quantity, :yearly_sqaa
  end
end
