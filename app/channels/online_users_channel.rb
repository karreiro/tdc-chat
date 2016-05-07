class OnlineUsersChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'users:new'
  end
end
