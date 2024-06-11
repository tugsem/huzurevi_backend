class RenameNurseIdToUserIdInNotes < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :notes, :nurses
    rename_column :notes, :nurse_id, :user_id
    add_foreign_key :notes, :users, column: :user_id
  end
end
