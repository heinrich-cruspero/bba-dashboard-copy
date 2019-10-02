class AddSubmittedToRentalReturn < ActiveRecord::Migration[5.1]
  def change
    add_column :rental_returns, :submitted, :boolean, default: false
  end
end
