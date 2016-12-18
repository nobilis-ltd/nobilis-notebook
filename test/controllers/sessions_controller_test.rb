require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup :set_omniauth

  test 'should successfully login user via google' do
    assert_difference('User.count', 1) do
      get :create, provider: 'google'
    end
    
    user = @controller.instance_eval { current_user }

    assert_not session[:user_id].nil?
    assert_redirected_to user_notes_path(user)
  end

  test 'should only run auth procedure if current user is not present' do
    get :create, provider: 'google'

    user = @controller.instance_eval { current_user }
    assert_no_difference("User.find(#{user.id}).updated_at") do
      get :create, provider: 'google'
    end
  end

  test 'should get destroy' do
    get :create, provider: 'google'

    delete :destroy

    assert session[:user_id].nil?
    assert_redirected_to root_path
  end

  test 'failed login goes to root_path and shows message' do
    get :auth_failure

    assert_redirected_to root_path
    assert_not_nil flash[:danger]
  end

  def set_omniauth
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  end
end
