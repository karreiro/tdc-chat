require 'test_helper'

class OnlineUsersChannelTest < ActionCable::TestCase
  test '#subscribed should calls stream_from with "users:new"' do
    assert_stream_from('users:new')

    OnlineUsersChannel.new(connection, identifier)
  end

  private

  def identifier
    ''
  end

  def assert_stream_from(broadcasting)
    OnlineUsersChannel.any_instance.expects(:stream_from).with(broadcasting)
  end

  def connection
    TestConnection.new
  end
end
