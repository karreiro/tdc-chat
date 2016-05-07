class RoomsController < ApplicationController
  before_action :authenticate!
  before_action :notify_users, only: [:index]

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  private

  def notify_users
    OnlineUsersJob.perform_later(current_user)
  end
end
