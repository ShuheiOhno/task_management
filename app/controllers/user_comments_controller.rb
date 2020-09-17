class UserCommentsController < ApplicationController
  def index
  end

  def new
    @user_comment = UserComment.new
    @users = []
    User.all.each do |user|
      @users << [user.name ,user.id]
    end
  end

  def create
    user_comment = UserComment.create(user_comment_params)
    if user_comment.save
      redirect_to user_message_user_path(id: current_user.id)
      flash[:notice] = "メッセージを送信しました"
    else
      redirect_to new_user_comment_path
      flash[:notice] = "メッセージの送信に失敗しました"
    end
  end

  def show
    @user_comment = UserComment.find(params[:id])
    @replies = ReplyUserComment.where(user_comment_id: @user_comment.id)
  end

  private
  def user_comment_params
    params.permit(:title, :comment, :to_user_id
    ).merge(user_id: current_user.id)
  end

end
