class AddLastSubmittedAtToWantLists < ActiveRecord::Migration[5.1]
  def change
    add_column :want_lists, :last_submitted_at, :datetime
  end
end
