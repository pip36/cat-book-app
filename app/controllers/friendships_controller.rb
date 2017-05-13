class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id], accepted: false)
    if @friendship.save
      flash[:notice] = "Friend request sent"
      redirect_to :back
    else
      flash[:alert] = "Request failed to send"
      redirect_to :back
    end
  end

  def update
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.update_attribute(:accepted, true)
    if @friendship.save
      flash[:notice] = "Accepted Friend"
      redirect_to @friendship.user
      puts @friendship.accepted
    else
      flash[:alert] = "Sorry! Failed to accept"
      redirect_to :back
    end
  end

  def destroy
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.destroy
    flash[:notice] = "friend removed!"
    redirect_to root_url
  end

end
