module UsersHelper

  def  is_friend?(user)
    current_user.friends.include?(user)
  end

  def is_pending_sent?(user)
    current_user.pending_friends.include?(user)
  end

  def is_pending_recieved?(user)
    current_user.requested_friendships.include?(user)
  end

  def get_friendship_id(user1, user2)
    a = user1.friendships.find_by(friend_id: user2.id, accepted: true)
    b = user2.friendships.find_by(friend_id: user1.id, accepted: true)
    return a unless a.nil?
    return b unless b.nil?
    nil
  end
end
