class CreateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
      t.references :source_type, foreign_key: true, null: false
      t.string :name, null: false, index: true

      t.timestamps
    end

    add_index :sources, [:source_type_id, :name], unique: true
  end
end
