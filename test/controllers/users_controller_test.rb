require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "should be able to delete a user" do
    user = create(:user, name: "That Guy")
    session[:user_id] = user.id

    delete :destroy, id: user.to_param

    assert_redirected_to root_url
    assert_nil(User.find_by(name: user.name))
  end

  test "should be able to update a user's slug" do
    user = create(:user, name: "That Guy")
    session[:user_id] = user.id

    post :update_slug, id: user.to_param, user: { slug: "foo-foo" }

    assert_equal "foo-foo", user.reload.slug
  end

  test "should not update empty slug" do
    user = create(:user, name: "That Guy")
    session[:user_id] = user.id

    post :update_slug, id: user.to_param, user: { slug: "" }

    assert_not_nil flash[:error]
  end

  test "should not update duplicate slug" do
    user = create(:user, name: "That Guy")
    user2 = create(:user, name: "Foo Foo")
    session[:user_id] = user2.id

    post :update_slug,id: user2.to_param, user: { slug: "that-guy" }

    assert_not_nil flash[:error]
  end
end
