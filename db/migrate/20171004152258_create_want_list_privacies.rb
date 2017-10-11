class CreateWantListPrivacies < ActiveRecord::Migration[5.1]
  def change
    create_table :want_list_privacies do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :want_list_privacies, :name, unique: true
  end
end
