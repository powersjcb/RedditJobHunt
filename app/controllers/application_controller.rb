class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception

  helper_method :current_user, :current_user_id, :logged_in?


  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def current_user_id
    current_user.id if logged_in?
  end

  def logged_in?
    !!current_user
  end

  def log_in_user!(user)
    session[:session_token] = user.session_token
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def redirect_unless_logged_in
    redirect_to new_session_url unless logged_in?
  end
end
