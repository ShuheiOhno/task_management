class ReplyUserCommentsController < ApplicationController

  def new
    ReplyUserComment.new
  end

  def create
    ReplyUserComment.create!(reply_user_comment_params)
    redirect_to user_path(current_user.id)
  end

  def show
    @replys = ReplyUserComment.where(user_comment_id: params[:user_comment_id])
  end

  private
  def reply_user_comment_params
    params.permit(:reply).merge(user_id: current_user.id, user_comment_id: params[:user_comment_id])
  end
end
