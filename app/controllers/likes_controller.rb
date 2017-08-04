class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(liked_id: params[:liked_id], liked_type: params[:liked_type])

    if @like.save

    else
      flash[:notice] = "failed"
    end

    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.user == current_user
      @like.destroy
    else
      flash[:alert] = "unlike failed"
    end

    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

end
