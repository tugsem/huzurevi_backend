class CreateStockLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :stock_logs do |t|
      t.string :stock_name
      t.integer :quantity
      t.string :to_whom
      t.integer :operation

      t.timestamps
    end
  end
end
