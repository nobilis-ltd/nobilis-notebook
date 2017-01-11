class CreateNoteBooks < ActiveRecord::Migration
  def change
    create_table :note_books do |t|
      t.string :name
      t.references :user, foreign_key: true, index: true
      t.timestamps null: false
    end
  end
end
