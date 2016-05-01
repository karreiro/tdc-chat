class SessionsController < ApplicationController
  def new
  end

  def create
    cookies.signed[:current_user_id] = find_user_id(params[:username])
    redirect_to root_url
  end

  def destroy
    cookies.signed[:current_user_id] = nil
    redirect_to new_session_url
  end

  private

  def find_user_id(username)
    User.find_or_create_by(username: username).id
  end
end
