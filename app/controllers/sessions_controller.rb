class SessionsController < ApplicationController
  def new
  end

  def create
    session[:username] = find_user(params[:username]).username
    redirect_to root_url
  end

  def destroy
    session[:username] = nil
    redirect_to new_session_url
  end

  private

  def find_user(username)
    User.find_or_create_by(username: username)
  end
end
