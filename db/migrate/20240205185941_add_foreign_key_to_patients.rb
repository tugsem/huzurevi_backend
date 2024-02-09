class AddForeignKeyToPatients < ActiveRecord::Migration[7.1]
  def change
    add_reference :patients, :nurses, foreign_key: { to_table: :nurses }
  end
end
