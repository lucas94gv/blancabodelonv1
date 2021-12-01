require "test_helper"

class WebControllerTest < ActionDispatch::IntegrationTest
  test "should get web_home" do
    get web_web_home_url
    assert_response :success
  end
end
