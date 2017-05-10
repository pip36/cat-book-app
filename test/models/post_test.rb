require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:phil)
    @post = Post.new(title: "test", body: "test content", user_id: @user.id)
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user should be able to create posts" do
    @user.posts.create(title: "new post", body: " an example post")
    assert @user.posts.last == Post.last
  end

  test "post body cant be blank" do
    @post.body = "   "
    assert_not @post.valid?
  end

  test "post must have a user_id" do
    @post.user_id = nil
    assert_not @post.valid?
  end


end
