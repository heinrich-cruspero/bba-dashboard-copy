class CreateAbeOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :abe_orders do |t|
      t.string :order_id, null: false, index: true
      t.boolean :dryrun, null: false, index: true
      t.string :reference_id, null: false, index: true

      t.timestamps
    end
  end
end
