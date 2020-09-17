class ReplyUserCommentsController < ApplicationController

  def new
    ReplyUserComment.new
  end

  def create
    reply = ReplyUserComment.create(reply_user_comment_params)
    if reply.save
      redirect_to user_message_user_path(id: current_user.id)
      flash[:notice] = "返信しました"
    else
      redirect_to new_user_comment_reply_user_comment_path(user_comment_id: reply.user_comment_id)
      flash[:notice] = "返信に失敗しました"
    end
  end

  def show
    @replys = ReplyUserComment.where(user_comment_id: params[:user_comment_id])
  end

  private
  def reply_user_comment_params
    params.permit(:reply).merge(user_id: current_user.id, user_comment_id: params[:user_comment_id])
  end
end
