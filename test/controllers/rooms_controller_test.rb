require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index when an user is logged in' do
    login('karreiro')

    get rooms_url

    assert_response :success
  end

  test 'should not get index when any user is logged in' do
    get rooms_url

    assert_redirected_to new_session_url
  end

  test 'should get show when an user is logged in' do
    login('karreiro')

    get room_url(rooms(:one))

    assert_response :success
  end

  test 'should not get show when any user is logged in' do
    get room_url(rooms(:one))

    assert_redirected_to new_session_url
  end

  def login(username)
    post session_url, params: { username: username }
  end
end
