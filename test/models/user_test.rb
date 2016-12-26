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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "slug is created when user is saved" do
    user = create(:user, name: "Foo Bar")
    assert_equal "foo-bar", user.slug
  end

  test "slug appends number if duplicate" do
    user = create(:user, name: "Foo Bar")
    user2 = create(:user, name: "Foo Bar")
    assert_match /foo-bar/, user2.slug
  end
end
