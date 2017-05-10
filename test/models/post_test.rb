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

  test "post body cant be blank" do
    @post.body = "   "
    assert_not @post.valid?
  end

  
end
