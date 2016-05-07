class OnlineUsersJob < ApplicationJob
  def perform(user)
    ActionCable.server.broadcast('users:new', user)
  end
end
