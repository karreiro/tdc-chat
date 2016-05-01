class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def logged_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:current_user_id])
  end

  protected

  def authenticate!
    redirect_to new_session_url unless logged_in?
  end
end
