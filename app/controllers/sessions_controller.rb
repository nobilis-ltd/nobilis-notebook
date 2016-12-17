class SessionsController < ApplicationController
  # Method to store data from omniauth(google), store it in the database and create a user session
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to notes_path
  end

  # Method to destroy a user session
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
