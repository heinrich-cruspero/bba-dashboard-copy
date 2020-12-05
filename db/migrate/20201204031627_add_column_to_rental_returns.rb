class AddColumnToRentalReturns < ActiveRecord::Migration[5.1]
  def change
    add_column :rental_returns, :label_url, :string
  end
end
