class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    item = Item.find params[:item_id]
    comment = item.comments.new(comment_params)
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
