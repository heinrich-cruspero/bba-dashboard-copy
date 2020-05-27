class CreateUserStores < ActiveRecord::Migration[5.1]
  def change
    create_table :user_stores do |t|
      t.references :fedex_account, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
    end
  end
end
