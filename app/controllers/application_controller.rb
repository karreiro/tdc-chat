class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def logged_in?
    !session[:username].nil?
  end

  def current_user
    session[:username]
  end

  protected

  def authenticate!
    redirect_to new_session_url unless logged_in?
  end
end
