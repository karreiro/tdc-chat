class RoomsController < ApplicationController
  before_action :authenticate!

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end
end
