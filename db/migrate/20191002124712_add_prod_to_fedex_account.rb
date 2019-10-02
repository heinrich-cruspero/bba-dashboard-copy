class AddProdToFedexAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :fedex_accounts, :prod, :boolean, default: false
  end
end
