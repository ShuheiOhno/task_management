class ProjectCommentsController < ApplicationController
  def index
  end

  def new
    @project_comment = ProjectComment.new
    @users = [] 
    User.all.each do |user|
      @users << [user.name, user.id]
    end
  end

  def create
    ProjectComment.create(project_comment_params)
    redirect_to root_path
  end

  def show
    @project_comment = ProjectComment.find(params[:id])
    @to_user = User.find(@project_comment.to_user_id)
  end

  private
  def project_comment_params
    params.permit(:title, :comment, :to_user_id, :project_id
    ).merge(user_id: current_user.id)
  end
end
