require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  test 'should get index with logged in user' do
    user = create(:user)
    session[:user_id] = user.to_param

    get :index, user_id: user.to_param
    assert_response :success
  end

  test 'should not get index with no user' do
    session[:user_id] = nil

    get :index, user_id: 'foo'
    assert_redirected_to root_path
    assert_not_nil flash[:danger]
  end

  test 'should create a new note' do
    user = create(:user)
    session[:user_id] = user.to_param

    get :new, user_id: user.to_param
    assert_response :success

    post :create, {
      user_id: user.to_param,
      note: {
        title: 'Another one',
        content: '*They don\'t want you to succeed.*'
      }
    }
    assert_redirected_to user_note_path(user, assigns(:note))
    assert_not_nil Note.find_by(title: 'Another one')
  end

  test 'should edit and update existing note' do
    user = create(:user)
    session[:user_id] = user.id
    note = create(:note, title: 'Testing 123', content: '*Bold* yet _slim_', user: user)

    get :edit, user_id: user.to_param, id: note.to_param
    assert_response :success
    assert_not_nil assigns(:note)

    patch :update, {
      user_id: user.to_param,
      id: note.to_param,
      note: {
        title: 'Testing update',
        content: '_slim_ yet *Bold*',
        public: true
      }
    }
    assert_redirected_to user_note_path(user, note)
    fetched_note = Note.find_by(title: 'Testing update')
    assert_not_nil fetched_note
    assert fetched_note.public
  end

  test 'should delete note' do
    # create user and log them in and create note
    user = create(:user)
    session[:user_id] = user.id
    note = create(:note, title: 'Testing 123', content: '*Bold* yet _slim_', user: user)

    delete :destroy, user_id: user.to_param, id: note.to_param
    assert_redirected_to user_notes_path(user)
    assert_nil Note.find_by(id: note.id)
  end
end
