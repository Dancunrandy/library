require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(email: "user@example.com", password: "password")
    sign_in @user
  end

  test "should get index" do
    get users_url
    assert_response :success
  end
end