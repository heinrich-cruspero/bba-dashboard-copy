class CreateIndabaInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :indaba_instances do |t|
      t.string :database_name, null: false, index: { unique: true }
      t.string :account_name, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
