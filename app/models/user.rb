# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  provider         :string
#  uid              :string
#  name             :string
#  oauth_token      :string
#  oauth_expires_at :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  slug             :string
#

class User < ActiveRecord::Base
  acts_as_hashids secret: "umteenth-user", length: 6

  has_many :notes

  # Create slug for new users
  after_create :create_slug

  # make sure slug is unique
  validates :slug, uniqueness: true

  # Method to check if the user is already saved in the database; creates a new user record if not.
  def self.from_omniauth auth_hash
    # find user if they already exist or create a new user
    user = self.where(uid: auth_hash[:uid], provider: auth_hash[:provider]).first_or_initialize
    user.provider = auth_hash.provider
    user.uid = auth_hash.uid
    user.name = auth_hash.info.name
    user.oauth_token = auth_hash.credentials.token
    user.oauth_expires_at = Time.at(auth_hash.credentials.expires_at)
    user.save!
    user
  end

  # Create a slug for public pages
  def create_slug
    self.slug = self.name.parameterize
    
    # Append a random number until saving works
    while !self.save
      self.slug += rand(1..10).to_s
    end
  end
end

