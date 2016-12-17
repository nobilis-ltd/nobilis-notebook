class SessionsController < ApplicationController

  layout 'site'
  
  # Method to store data from omniauth(google), store it in the
  # database and create a user session
  def create
    # only run login flow when there is no logged in user
    unless current_user.present?
      user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
    end
    
    flash[:success] = "Welcome, #{current_user.name}"
    redirect_to user_notes_path(current_user)
  end

  # Method to destroy a user session
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def auth_failure
    flash[:danger] = 'There was a problem signing in. Please try again.'
    redirect_to root_path
  end
end
