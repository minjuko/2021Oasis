require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "authentication is required" do
    get user_url(users(:one))
    assert_redirected_to new_user_session_url
  end

  test "another user's profile does not expose account credentials or edit controls" do
    sign_in users(:two)
    get user_url(users(:one))
    assert_response :success
    assert_not_includes response.body, users(:one).email
    assert_not_includes response.body, "프로필 수정"
    assert_not_includes response.body, "동승 내역"
  end

  test "user can see own profile controls" do
    sign_in users(:one)
    get user_url(users(:one))
    assert_response :success
    assert_includes response.body, "프로필 수정"
  end
end
