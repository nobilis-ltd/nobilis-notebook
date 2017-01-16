# == Schema Information
#
# Table name: note_books
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_note_books_on_user_id  (user_id)
#

class NoteBook < ActiveRecord::Base
  belongs_to :user
end
