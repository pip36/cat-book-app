class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(liked_id: params[:liked_id], liked_type: params[:liked_type])
    if @like.save
      flash[:notice] = "liked post"
      redirect_to root_url
    else
      flash[:notice] = "failed"
      redirect_to root_url
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.user == current_user
      @like.destroy
      flash[:notice] = "Unliked"
      redirect_to root_url
    else
      flash[:alert] = "unlike failed"
      redirect_to root_url
    end
  end

end
