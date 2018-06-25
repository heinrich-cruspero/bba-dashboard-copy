class CreateSourceTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :source_types do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :source_types, :name, unique: true
  end
end
