class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    comment = Comment.new(comment_params)
    comment.commentable_id = params[:item_id]
    comment.commentable_type = "Item"
    comment.user = current_user
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
