require "application_system_test_case"

class RidesTest < ApplicationSystemTestCase
  test "unauthenticated visitor is sent to sign in" do
    visit rides_url
    assert_current_path new_user_session_path
  end
end
