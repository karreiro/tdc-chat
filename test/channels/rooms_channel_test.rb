require 'test_helper'

class RoomsChannelTest < ActionCable::TestCase
  setup do
    @channel = RoomsChannel.new(connection(users(:eder)), identifier)
  end

  test '#follow should calls stream_from with "rooms:ROOM_ID:messages"' do
    assert_stream_from(RoomsChannel, 'rooms:1:messages')

    @channel.follow('room_id' => '1')
  end

  test '#say should broadcast the message in the room\'s channel' do
    assert_broadcast_to(channel: 'rooms:1:messages', data: { username: 'ederign',
                                                             message: 'hi' })

    @channel.say('room_id' => '1', 'message' => 'hi')
  end
end
