class ChangeColumnNameToNote < ActiveRecord::Migration[7.1]
  def change
    rename_column :medication_records, :notes, :note
  end
end
