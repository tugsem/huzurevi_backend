class CreateNurses < ActiveRecord::Migration[7.1]
  def change
    create_table :nurses do |t|
        t.string :first_name
        t.string :last_name
        t.date :date_of_birth
        t.string :gender
        t.string :contact_number
        t.string :email
        t.string :username
        t.string :password_digest
        t.timestamps
    end
      add_index :nurses, :email
  end
end
