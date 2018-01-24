require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get user_add_url
    assert_response :success
  end

  test "should get update" do
    get user_update_url
    assert_response :success
  end

end
