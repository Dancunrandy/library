require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test "should get new" do
    get login_path
    assert_response :success
  end

  test "should create session" do
    post login_path, params: { session: { email: @user.email, password: 'password' } }
    assert_redirected_to @user
    assert is_logged_in?
  end

  test "should not create session with invalid information" do
    post login_path, params: { session: { email: @user.email, password: 'wrong_password' } }
    assert_template 'sessions/new'
    assert_not flash.empty?
  end

  test "should destroy session" do
    delete logout_path
    assert_redirected_to root_url
    assert_not is_logged_in?
  end
end