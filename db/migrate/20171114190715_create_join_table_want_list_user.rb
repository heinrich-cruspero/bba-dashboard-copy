class CreateJoinTableWantListUser < ActiveRecord::Migration[5.1]
    def change
      create_table :users_want_lists, id: false do |t|
        t.references :want_list, index: true, null: false
        t.references :user, index: true, null: false
      end
      add_foreign_key :users_want_lists, :want_lists
      add_foreign_key :users_want_lists, :users
      add_index :users_want_lists, [:want_list_id, :user_id], unique: true
  end
end
