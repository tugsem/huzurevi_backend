class ChangeStockIdToAllowNull < ActiveRecord::Migration[7.0]
  def change
    change_column :stock_logs, :stock_id, :bigint, null: true
  end
end
