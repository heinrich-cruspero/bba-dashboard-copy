class CreateWantLists < ActiveRecord::Migration[5.1]
  def change
    create_table :want_lists do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :want_list_privacy, foreign_key: true

      t.timestamps
    end
  end
end
