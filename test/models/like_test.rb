require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @phil = users(:phil)
    @bob = users(:bob)
    @post = @phil.posts.create(title:"new post", body: "post text here")
    @like = @bob.likes.create(liked_id: @post.id, liked_type:"Post")
  end

  test "like is valid" do
    assert @like.valid?
  end

  test "like belongs to creator" do
    assert @like.user == @bob
  end

  test "post has a like" do
    assert @post.likes.first == @like
  end



end
