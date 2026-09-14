require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ride = rides(:one)
    @comment = comments(:two)
  end

  test "authentication is required to create a comment" do
    assert_no_difference("Comment.count") do
      post ride_comments_url(@ride), params: { comment: {} }
    end
    assert_redirected_to new_user_session_url
  end

  test "server assigns current user when creating a comment" do
    sign_in users(:three)
    assert_difference("Comment.count", 1) do
      post ride_comments_url(@ride), params: { comment: { user_id: users(:one).id } }
    end
    assert_equal users(:three), Comment.order(:created_at).last.user
    assert_redirected_to ride_url(@ride)
  end

  test "comment author can delete with a safe fallback" do
    sign_in @comment.user
    assert_difference("Comment.count", -1) { delete ride_comment_url(@ride, @comment) }
    assert_redirected_to ride_url(@ride)
  end

  test "ride owner can delete a comment" do
    sign_in @ride.user
    assert_difference("Comment.count", -1) { delete ride_comment_url(@ride, @comment) }
  end

  test "another user cannot delete a comment" do
    sign_in users(:three)
    assert_no_difference("Comment.count") do
      assert_raises(ActiveRecord::RecordNotFound) do
        delete ride_comment_url(@ride, @comment)
      end
    end
  end
end
