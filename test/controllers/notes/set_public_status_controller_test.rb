require 'test_helper'

class Notes::SetPublicStatusControllerTest < ActionController::TestCase
  test "should make a note public" do
    # create and log in user
    user = create(:user)
    session[:user_id] = user.id
    note = create(:note, title: 'Testing 123', content: '*Bold* yet _slim_', user: user)

    get :publicise, user_id: user.to_param, id: note.to_param
    assert note.reload.public
  end

  test "should make a note private" do
    # create and log in user
    user = create(:user)
    session[:user_id] = user.id
    note = create(:note, title: 'Testing 123', content: '*Bold* yet _slim_', user: user, public: true)

    get :privatise, user_id: user.to_param, id: note.to_param
    assert_not note.reload.public
  end
end
