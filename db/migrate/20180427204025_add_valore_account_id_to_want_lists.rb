class AddValoreAccountIdToWantLists < ActiveRecord::Migration[5.1]
  def change
    add_reference :want_lists, :valore_account, foreign_key: true
  end
end
