class UsersController < ApplicationController
  # Update a users slug
  def update_slug
    user = current_user

    if user_params[:slug].blank?
      flash[:error] = "You must provide a value for the slug"
      redirect_to user_notes_path(current_user) and return
    end

    # parameterize and store slug
    user.slug = user_params[:slug].parameterize
    if user.save
      flash[:success] = "Your changes have been saved"
    else
      flash[:error] = user.errors.full_messages.join(". ")
    end

    redirect_to user_notes_path(current_user)
  end

  # Method to delete a user's account
  def destroy
    user = User.find(params[:id])
    user.destroy
    session[:user_id] = nil

    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:slug)
  end
end
