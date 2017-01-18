# == Schema Information
#
# Table name: note_books
#
#  id         :integer          not null, primary key
#  title      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_note_books_on_user_id  (user_id)
#

class NoteBook < ActiveRecord::Base
  acts_as_hashids secret: "notebook-notebook", length: 6

  belongs_to :user
  has_many :notes
end
