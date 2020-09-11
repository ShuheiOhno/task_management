class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    Comment.create(comment_params)
    redirect_to user_path(current_user.id)
  end

  private
  def comment_params
    params.permit(:content, :image).merge(user_id: current_user.id)

    # comment/index.html.hamlで使うなら下
    # params.require(:comment).permit(:content, :image).merge(user_id: current_user.id)
  end
end
