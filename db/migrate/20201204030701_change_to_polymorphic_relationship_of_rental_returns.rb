class ChangeToPolymorphicRelationshipOfRentalReturns < ActiveRecord::Migration[5.1]
  def change
    rename_column :rental_returns, :fedex_account_id, :accountable_id
    add_column :rental_returns, :accountable_type, :string
    add_column :rental_returns, :label_url, :string

    RentalReturn.reset_column_information
    RentalReturn.update_all(accountable_type: 'FedexAccount')

    # remove fedex_accounts foreign key from rental_returns
    if foreign_key_exists?(:rental_returns, :fedex_accounts)
      remove_foreign_key :rental_returns, :fedex_accounts
    end
  end
end
