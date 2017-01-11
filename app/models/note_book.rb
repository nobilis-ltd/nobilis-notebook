# == Schema Information
#
# Table name: note_books
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class NoteBook < ActiveRecord::Base
  belongs_to :user
end
