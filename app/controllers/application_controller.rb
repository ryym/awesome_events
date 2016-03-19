class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Register 'logged_in?' as a helper method to use it in views.
  helper_method :logged_in?

  private

  # Return whether or not the user is logged in.
  def logged_in?
    !! session[:user_id]
  end
end
