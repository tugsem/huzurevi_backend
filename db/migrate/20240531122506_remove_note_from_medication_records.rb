class RemoveNoteFromMedicationRecords < ActiveRecord::Migration[7.1]
  def change
    remove_column :medication_records, :note
  end
end
