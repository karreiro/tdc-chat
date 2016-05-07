class RoomsController < ApplicationController
  before_action :authenticate!
  before_action :new_online_user, only: [:index]

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  private

  def new_online_user
    OnlineUsersJob.perform_later(current_user)
  end
end
