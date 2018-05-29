class AddAbeAccountIdToWantLists < ActiveRecord::Migration[5.1]
  def change
    add_reference :want_lists, :abe_account, foreign_key: true
  end
end
