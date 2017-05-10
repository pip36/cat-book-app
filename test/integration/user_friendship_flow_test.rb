require 'test_helper'

class UserFriendshipFlowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:phil)
    @friend = users(:bob)
  end

  test "send new friend request" do
    @user.friendships.create(friend_id: @friend.id, accepted: false)
    assert @user.friendships.count == 1
    assert @user.pending_friends.count == 1
    assert @friend.requested_friendships.count == 1
    assert @user.pending.count == 1
  end

  test "accept a friend request" do
    @friendship = @friend.friendships.create(friend_id: @user.id, accepted: false)
    patch friendship_url(@friendship)
    follow_redirect!
    assert @user.friends.count == 1
    assert @friend.friends.count == 1
    assert @user.pending.count == 0
    assert @friend.pending.count == 0
  end

end
