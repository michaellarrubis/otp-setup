require "test_helper"

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get page_index_url
    assert_response :success
  end

  test "should get login" do
    get page_login_url
    assert_response :success
  end

  test "should get otp" do
    get page_otp_url
    assert_response :success
  end

  test "should get add_otp" do
    get page_add_otp_url
    assert_response :success
  end
end
