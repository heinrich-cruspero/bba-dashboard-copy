class AddUploadStatusToWantLists < ActiveRecord::Migration[5.1]
  def change
    add_column :want_lists, :upload_status, :string
  end
end
