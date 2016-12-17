require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup :set_omniauth
  
  test "should successfully login user via google" do
    assert_difference("User.count", 1) do
      get :create, {provider: "google"}
    end
    
    assert_not session[:user_id] == nil
    assert_redirected_to root_path
  end

  test "should get destroy" do
    get :create, {provider: "google"}

    delete :destroy

    assert session[:user_id] == nil
    assert_redirected_to root_path
  end

  def set_omniauth
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google]
  end
end
