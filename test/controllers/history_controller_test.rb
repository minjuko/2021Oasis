require "test_helper"

class HistoryControllerTest < ActionDispatch::IntegrationTest
  test "authentication is required for every history page" do
    [history_collect_url, history_full_url, history_complete_url].each do |url|
      get url
      assert_redirected_to new_user_session_url
    end
  end

  test "authenticated user can view history" do
    sign_in users(:one)
    get history_collect_url
    assert_response :success
  end
end
