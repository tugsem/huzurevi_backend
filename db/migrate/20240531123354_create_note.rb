class CreateNote < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|
      t.text :note
      t.references :patients, null: false, foreign_key: true
      t.references :nurses, null: false, foreign_key: true

      t.timestamps
    end
  end
end
