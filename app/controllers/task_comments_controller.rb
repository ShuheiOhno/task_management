class TaskCommentsController < ApplicationController
  def index
  end

  def new
    @task_comment = TaskComment.new
  end

  def create
    TaskComment.create(task_comment_params)
    redirect_to root_path
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
