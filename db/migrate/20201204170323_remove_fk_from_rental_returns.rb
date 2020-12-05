class RemoveFkFromRentalReturns < ActiveRecord::Migration[5.1]
  def change
    if foreign_key_exists?(:rental_returns, :fedex_accounts)
      remove_foreign_key :rental_returns, :fedex_accounts
    end
  end
end
