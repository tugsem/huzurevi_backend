class AddStockToStockLogs < ActiveRecord::Migration[7.0]
  def change
    add_reference :stock_logs, :stock, null: false, foreign_key: true
  end
end
