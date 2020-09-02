class ProjectCommentsController < ApplicationController
  def index
  end

  def new
    @project_comment = ProjectComment.new
  end

  def create
    ProjectComment.create(project_comment_params)
    redirect_to root_path
  end

  private
  def project_comment_params
    params.permit(:title, :comment, :to_user_id, :project_id
    ).merge(user_id: current_user.id)
  end
end
