require 'test_helper'

class UserRegistrationTest < ActionDispatch::IntegrationTest
  test "should sign up user" do
    get new_user_registration_path
    assert_response :success

    assert_difference('User.count') do
      post user_registration_path, params: { user: { email: "user@example.com", password: "password" } }
    end
    assert_redirected_to root_path
  end
end