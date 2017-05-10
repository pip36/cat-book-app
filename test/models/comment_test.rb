require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:phil)
    @user2 = users(:bob)
    @user.posts.create(title: "post", body: "post text")
    @postcomment = @user2.comments.create(body: "a test comment", commentable_id: @user.posts.first.id, commentable_type: "Post")
    @comcomment = @user.comments.create(body: "a reply to a comment", commentable_id: @user2.comments.first.id, commentable_type: "Comment")
  end

  test "a valid post comment" do
    assert @postcomment.valid?
  end

  test "a valid comment comment" do
    assert @comcomment.valid?
  end

  test "empty comment should not be valid" do
    @postcomment.body = "  "
    @comcomment.body = "    "
    assert_not @postcomment.valid?
    assert_not @comcomment.valid?
  end

  test "comment with no user id should not be valid" do
    @postcomment.user_id = nil
    @comcomment.user_id = nil
    assert_not @postcomment.valid?
    assert_not @comcomment.valid?
  end

  test "comment with no commentable id should not be valid" do
    @postcomment.commentable_id = nil
    @comcomment.commentable_id = nil
    assert_not @postcomment.valid?
    assert_not @comcomment.valid?
  end

  test "comment with no commentable type should not be valid" do
    @postcomment.commentable_type = nil
    @comcomment.commentable_type = nil
    assert_not @postcomment.valid?
    assert_not @comcomment.valid?
  end

end
