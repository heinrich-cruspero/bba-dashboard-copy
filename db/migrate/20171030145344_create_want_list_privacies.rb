class CreateWantListPrivacies < ActiveRecord::Migration[5.1]
  def change
    create_table :want_list_privacies do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
