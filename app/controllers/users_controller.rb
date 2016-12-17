class UsersController < ApplicationController
  # Method to delete a user's account
  def destroy
    user = User.find(params[:id])
    user.destroy
    session[:user_id] = nil

    redirect_to root_path
  end
end
