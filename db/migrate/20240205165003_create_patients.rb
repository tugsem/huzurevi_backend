class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :contact_number
      t.string :email
      t.string :gender
      t.string :address
      t.text :medical_history
      t.text :medications
      t.integer :assigned_nurse_id
      t.integer :room_number
      t.string :status

      t.timestamps
    end

    add_index :patients, :email
    add_index :patients, :assigned_nurse_id
  end
end
