require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  test 'should get index with logged in user' do
    user = create(:user)
    session[:user_id] = user.id

    get :index
    assert_response :success
  end

  test 'should not get index with no user' do
    get :index
    assert_redirected_to root_path
    assert_not_nil flash[:danger]
  end
end
