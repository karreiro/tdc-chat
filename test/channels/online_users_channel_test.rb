require 'test_helper'

class OnlineUsersChannelTest < ActionCable::TestCase
  test '#subscribed should calls stream_from with "users:new"' do
    assert_stream_from(OnlineUsersChannel, 'users:new')

    OnlineUsersChannel.new(connection, identifier)
  end
end
