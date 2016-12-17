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
#

class User < ActiveRecord::Base
  acts_as_hashids secret: "umteenth-user", length: 6

  def self.from_omniauth auth_hash
    # find user if they already exist
    user = self.find_by(uid: auth_hash[:uid], provider: auth_hash[:provider])
    
    # return user if found
    return user if user

    # create user if not
    user = User.new
    user.provider = auth_hash.provider
    user.uid = auth_hash.uid
    user.name = auth_hash.info.name
    user.oauth_token = auth_hash.credentials.token
    user.oauth_expires_at = Time.at(auth_hash.credentials.expires_at)
    user.save!

    if user.save
      return user
    else
      return nil
    end
  end
end

