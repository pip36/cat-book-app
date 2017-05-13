class CommentsController < ApplicationController

def create
  @comment = current_user.comments.create(comments_params)
  if @comment.save
    flash[:notice] = "Comment posted!"
    redirect_to root_url
  else
    flash[:alert] = "Comment failed..."
    redirect_to root_url
  end
end

def destroy
  @comment = Comment.find(params[:id])
  if @comment.user == current_user
    @comment.destroy
    flash[:notice] = "Comment deleted"
    redirect_to root_url
  else
    flash[:alert] = "Delete failed"
    redirect_to root_url
  end
end

private
def comments_params
  params.require(:comment).permit(:commentable_id, :commentable_type, :body)
end

end
