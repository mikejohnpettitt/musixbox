require "test_helper"

class CameraControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get camera_show_url
    assert_response :success
  end
end
