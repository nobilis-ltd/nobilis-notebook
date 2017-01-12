class AddNoteBookReferenceToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :note_book_id, :integer, foreign_key: true, index: true
  end
end
