class ModifyForeignKeyConstraint < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :stock_logs, :stocks
    add_foreign_key :stock_logs, :stocks, on_delete: :nullify
  end
end
