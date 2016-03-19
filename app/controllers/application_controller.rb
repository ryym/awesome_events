class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Register as helper methods to use them in views.
  helper_method :logged_in?, :current_user

  private

  # Return the current logged in user.
  def current_user
    return unless logged_in?
    @current_user ||= User.find(session[:user_id])
  end

  # Redirect to the home page when there is no logged in user.
  # It should be used as 'before_action'.
  def authenticate
    return if logged_in?
    redirect_to root_path, alert: 'ログインしてください'
  end

  # Return whether or not the user is logged in.
  def logged_in?
    !! session[:user_id]
  end
end
