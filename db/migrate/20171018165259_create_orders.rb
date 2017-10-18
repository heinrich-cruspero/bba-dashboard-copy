class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :book, null: false, foreign_key: true, index: true
      t.string :buyer_email, null: false, index: true

      t.timestamps
    end
  end
end
