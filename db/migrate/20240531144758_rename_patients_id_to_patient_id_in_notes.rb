class RenamePatientsIdToPatientIdInNotes < ActiveRecord::Migration[7.1]
  def change
    rename_column :notes, :patients_id, :patient_id
  end
end
