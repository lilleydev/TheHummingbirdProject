class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  # def current_user
  #   @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  # end

  # def logged_in?
  #   !!current_user
  # end

  # def redirect_if_logged_out
  #   redirect_to '/' unless current_user
  # end
end
