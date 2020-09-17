class TaskCommentsController < ApplicationController
  def index
  end

  def new
    @task_comment = TaskComment.new
    @users = []
    User.all.each do |user|
      @users << [user.name, user.id]
    end
  end

  def create
    task_comment = TaskComment.create(task_comment_params)
    if task_comment.save
      redirect_to project_task_path(project_id: task_comment.task.project_id, task_id: task_comment.task_id, id: current_user.id)
      flash[:notice] = "コメントを保存しました"
    else
      redirect_back(fallback_location: new_project_task_task_comment_path(project_id: task_comment.task.project_id, task_id: task_comment.task_id))
      flash[:notice] = "コメントの保存に失敗しました"
    end
  end

  def show
    @task_comment = TaskComment.where(task_id: params[:task_id])
  end

  private
  def task_comment_params
    params.permit(:title, :comment, :to_user_id, :task_id
    ).merge(user_id: current_user.id)
  end
end
