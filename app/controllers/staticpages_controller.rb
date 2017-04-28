class StaticpagesController < ApplicationController
respond_to :html, :js

  def index

    if user_signed_in?
      @postfeed = Post.paginate(page: params[:page], per_page:10)
      @comment = current_user.comments.new
    end
    respond_with @postfeed
  end


end
