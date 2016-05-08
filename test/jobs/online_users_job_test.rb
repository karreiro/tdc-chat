require 'test_helper'

class OnlineUsersJobTest < ActiveJob::TestCase
  test '#perform should broadcast the "users:new" message and the user' do
    check_broadcast_call(message: 'users:new', user: user)

    OnlineUsersJob.perform_now(user)
  end

  private

  def user
    users(:guilherme)
  end

  def check_broadcast_call(message: nil, user: nil)
    ActionCable.stubs(:server).returns server_mock(message, user)
  end

  def server_mock(message, user)
    mock.tap { |m| m.expects(:broadcast).with(message, user) }
  end
end
