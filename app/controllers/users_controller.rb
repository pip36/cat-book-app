class UsersController < ApplicationController

before_action :authenticate_user!
respond_to :html, :js


  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = current_user.posts.build
    @comment = current_user.comments.new

    if @user != current_user
      @relationship = current_user.relationships.new
    end
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 15)

    respond_with @users
  end
end
