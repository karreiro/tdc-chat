class SessionsController < ApplicationController
  def new
  end

  def create
    session[:username] = params[:username]
    redirect_to root_url
  end

  def destroy
    session[:username] = nil
    redirect_to new_session_url
  end
end
