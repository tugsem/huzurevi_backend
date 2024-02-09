class CreateMedicationRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :medication_records do |t|
      t.integer :patient_id
      t.string :medication_name
      t.string :dosage
      t.datetime :administration_time
      t.integer :nurse_id
      t.text :notes

      t.timestamps
    end
    add_index :medication_records, :patient_id
    add_index :medication_records, :nurse_id
  end
end
