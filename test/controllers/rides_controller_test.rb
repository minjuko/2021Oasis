require "test_helper"

class RidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @owner = users(:one)
    @other_user = users(:two)
    @ride = rides(:one)
  end

  test "authentication is required" do
    get rides_url
    assert_redirected_to new_user_session_url
  end

  test "owner can edit update and destroy ride" do
    sign_in @owner
    get edit_ride_url(@ride)
    assert_response :success
    patch ride_url(@ride), params: { ride: { memo: "updated" } }
    assert_redirected_to ride_url(@ride)
    assert_equal "updated", @ride.reload.memo
    assert_difference("Ride.count", -1) { delete ride_url(@ride) }
    assert_redirected_to rides_url
  end

  test "another user cannot edit ride" do
    sign_in @other_user
    assert_raises(ActiveRecord::RecordNotFound) { get edit_ride_url(@ride) }
  end

  test "another user cannot update ride" do
    sign_in @other_user
    assert_raises(ActiveRecord::RecordNotFound) do
      patch ride_url(@ride), params: { ride: { memo: "intrusion" } }
    end
    assert_not_equal "intrusion", @ride.reload.memo
  end

  test "another user cannot destroy ride" do
    sign_in @other_user
    assert_raises(ActiveRecord::RecordNotFound) { delete ride_url(@ride) }
    assert Ride.exists?(@ride.id)
  end

  test "filters by departure arrival date and same sex option" do
    sign_in @owner
    matching = Ride.create!(user: @owner, departure: "광주역", arrival: "터미널",
      reservation: Time.zone.local(2021, 8, 19, 12, 0), min: 2,
      memo: "matching-filter-result", via: false, samesex: true, left: 2, end: false)
    Ride.create!(user: @owner, departure: matching.departure, arrival: matching.arrival,
      reservation: matching.reservation + 1.day, min: 2,
      memo: "non-matching-filter-result", via: false, samesex: true, left: 2, end: false)

    get rides_url, params: { departure: matching.departure, arrival: matching.arrival,
      start_date: "2021-08-19", samesex: "true" }

    assert_response :success
    assert_includes response.body, "matching-filter-result"
    assert_not_includes response.body, "non-matching-filter-result"
  end

  test "invalid date does not raise an error" do
    sign_in @owner
    get rides_url, params: { start_date: "not-a-date" }
    assert_response :success
  end

  test "ride deletion removes its comments" do
    sign_in @owner
    comment_ids = @ride.comments.ids
    delete ride_url(@ride)
    assert_empty Comment.where(id: comment_ids)
  end

  test "show handles missing TMAP key without a network request" do
    sign_in @owner
    old_key = ENV.delete("TMAP_APP_KEY")
    get ride_url(@ride)
    assert_response :success
    assert_includes response.body, "TMAP API key"
  ensure
    ENV["TMAP_APP_KEY"] = old_key if old_key
  end

  test "show contains TMAP failure timeout and empty route handling" do
    sign_in @owner
    old_key = ENV["TMAP_APP_KEY"]
    ENV["TMAP_APP_KEY"] = "test-placeholder"
    get ride_url(@ride)
    assert_response :success
    assert_includes response.body, "timeout : 10000"
    assert_includes response.body, "경로 정보를 찾을 수 없습니다."
    assert_includes response.body, "TMAP 경로 정보를 불러오지 못했습니다."
  ensure
    old_key ? ENV["TMAP_APP_KEY"] = old_key : ENV.delete("TMAP_APP_KEY")
  end
end
