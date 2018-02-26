class AddTqsToIndabaInstanceData < ActiveRecord::Migration[5.1]
  def change
    add_column :indaba_instance_data, :tqs, :integer
  end
end
