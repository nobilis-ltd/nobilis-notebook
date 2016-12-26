# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  content    :text
#  title      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  public     :boolean          default(FALSE)
#
# Indexes
#
#  index_notes_on_user_id  (user_id)
#

class Note < ActiveRecord::Base
  acts_as_hashids secret: "neat-notes", length: 6

  belongs_to :user
end
