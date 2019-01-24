require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get healthcheck" do
    get welcome_healthcheck_url
    assert_response :success
  end

  test "should get status" do
    get welcome_status_url
    assert_response :success
  end

end
