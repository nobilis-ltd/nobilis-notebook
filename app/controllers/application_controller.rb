class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :user_logged_in?

  def current_user
    # @current_user = User.find(1)
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_logged_in?
    !current_user.blank?
  end

  # action to require user
  def require_user
    unless user_logged_in?
      flash[:danger] = 'You must sign in to view this page.'
      redirect_to root_path and return
    end
  end
end
