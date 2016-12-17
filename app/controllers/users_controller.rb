class UsersController < ApplicationController
  # Method to delete a user's account
  # 
  # @param id - User's encrypted id. Passed in the url
  # @return none - Redirects to the landing page
  def destroy
    user = User.find(params[:id])
    user.destroy
    session[:user_id] = nil

    redirect_to root_path
  end
end
