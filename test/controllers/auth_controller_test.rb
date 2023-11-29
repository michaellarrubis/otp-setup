require "test_helper"

class AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get logout" do
    get auth_logout_url
    assert_response :success
  end

  test "should get qr" do
    get auth_qr_url
    assert_response :success
  end
end
