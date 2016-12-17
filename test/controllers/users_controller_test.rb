require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  test "should be able to delete a user" do
    user = create(:user, name: "That Guy")

    delete :destroy, id: user.to_param

    assert_redirected_to root_url
    assert_nil(User.find_by(name: user.name))
  end
end
