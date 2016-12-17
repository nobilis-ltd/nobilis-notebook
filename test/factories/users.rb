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

FactoryGirl.define do
  factory :user do
    provider "Google"
    uid "123456789"
    name "This Guy"
    oauth_token "MyString"
    oauth_expires_at "2016-12-17 16:40:48"
  end
end
