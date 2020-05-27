class AddFeeFieldsToValoreAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :valore_accounts, :percentage_fee, :float, null: false, default: 0.00
    add_column :valore_accounts, :flat_fee, :float, null: false, default: 0.00
  end
end
