class AddActiveToWantLists < ActiveRecord::Migration[5.1]
  def change
    add_column :want_lists, :active, :boolean
  end
end
