class AddDirectOrderHistoryColumnsToIndabaData < ActiveRecord::Migration[5.1]
  def change
    add_column :indaba_data, :daily_sqad, :int, null: false, default: 0
    add_column :indaba_data, :monthly_sqad, :int, null: false, default: 0
    add_column :indaba_data, :yearly_sqad, :int, null: false, default: 0
  end
end
