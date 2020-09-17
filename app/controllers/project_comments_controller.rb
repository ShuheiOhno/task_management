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
    project_comment = ProjectComment.new(project_comment_params)
    if project_comment.save
      redirect_to project_path(id: project_comment.project_id)
      flash[:notice] = "コメントしました"
    else
      redirect_back(fallback_location: new_project_path)
      flash[:notice] = "コメント投稿に失敗しました"
    end
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
