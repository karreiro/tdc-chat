require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_session_url

    assert_response :success
  end

  test 'should log in a new user' do
    post session_url, params: { username: 'karreiro' }

    assert controller.logged_in?
    assert_redirected_to root_url
  end

  test 'should log out an user' do
    delete session_url

    assert_not controller.logged_in?
    assert_redirected_to new_session_url
  end
end
