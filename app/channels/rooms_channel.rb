class RoomsChannel < ApplicationCable::Channel
  def follow(data)
    stream_from channel(data)
  end

  def say(data)
    ActionCable.server.broadcast channel(data), message(data)
  end

  private

  def channel(data)
    "rooms:#{data['room_id']}:messages"
  end

  def message(data)
    {
      username: current_user.username,
      message: data['message']
    }
  end
end
