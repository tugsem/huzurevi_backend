class RenameNursesIdToNurseIdInNotes < ActiveRecord::Migration[7.1]
  def change
    rename_column :notes, :nurses_id, :nurse_id
  end
end
