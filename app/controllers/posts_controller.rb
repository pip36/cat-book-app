class PostsController < ApplicationController


before_action :authenticate_user!

  def create
    @user = current_user



    @post = @user.posts.build(post_params)
    if @post.save
      redirect_to @user
      flash[:notice] = "Post successfully created"
    else
      render 'users/show'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
      @post.destroy
      flash[:notice] = "Post deleted"
      redirect_to current_user
    else
      flash[:alert] = "Delete failed"
      redirect_to current_user
    end
  end




private
  def post_params
    params.require(:post).permit(:title, :body, :picture)
  end
end
