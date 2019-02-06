class RemoveAuditedFromTrackedSkus < ActiveRecord::Migration[5.1]
  def change
    remove_column :tracked_skus, :audited, :bool
  end
end
