require 'test_helper'

class ApplicationCable::ConnectionTest < ActionCable::TestCase
  setup do
    @connection = ApplicationCable::Connection.new(server, env)
  end

  test '.identified_by :current_user' do
    assert @connection.identifiers.include?(:current_user)
  end

  test '#connect when there\'s an user logged in' do
    login_as(users(:natalia))

    @connection.connect

    assert @connection.current_user, users(:natalia)
  end

  test '#connect when there\'s no user logged in' do
    assert_raises(ActionCable::Connection::Authorization::UnauthorizedError) do
      @connection.connect
    end
  end

  private

  def login_as(user)
    @connection.stubs(:cookies).returns fake_cookies(user)
  end

  def fake_cookies(user)
    stub(signed: { current_user_id: user.id })
  end

  def server
    TestServer.new
  end

  def env
    {}
  end
end
