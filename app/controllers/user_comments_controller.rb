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
    UserComment.create(user_comment_params)
    redirect_to root_path
  end

  private
  def user_comment_params
    params.permit(:title, :comment, :to_user_id
    ).merge(user_id: current_user.id)
  end

end
