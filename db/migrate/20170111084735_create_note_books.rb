class CreateNoteBooks < ActiveRecord::Migration
  def change
    create_table :note_books do |t|

      t.timestamps null: false
    end
  end
end
