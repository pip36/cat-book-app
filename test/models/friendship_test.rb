require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:phil)
    @friend = users(:bob)
    @friendship = Friendship.create(user_id: @user.id, friend_id: @friend.id, accepted: false)
  end

  test "should be valid friendship" do
    assert @friendship.valid?
  end

  test "user id cannot be blank" do
    @friendship.user_id = nil
    assert_not @friendship.valid?
  end

  test "friend_id cannot be blank" do
    @friendship.friend_id = nil
    assert_not @friendship.valid?
  end

  test "accepted cannot be blank" do
    @friendship.accepted = nil
    assert_not @friendship.valid?
    end

end
