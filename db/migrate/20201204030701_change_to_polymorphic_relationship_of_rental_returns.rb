class ChangeToPolymorphicRelationshipOfRentalReturns < ActiveRecord::Migration[5.1]
  def change
    rename_column :rental_returns, :fedex_account_id, :accountable_id
    add_column :rental_returns, :accountable_type, :string
    RentalReturn.reset_column_information
    RentalReturn.update_all(accountable_type: 'FedexAccount')
  end
end
