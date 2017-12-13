class CreateJoinTableWantListUser < ActiveRecord::Migration[5.1]
  def change
    create_join_table :want_lists, :users do |t|
      t.index [:want_list_id, :user_id]
      t.index [:user_id, :want_list_id]
    end
  end
end
