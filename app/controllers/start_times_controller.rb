class StartTimesController < ApplicationController
  
  def create
    start_time =StartTime.create(start_time_params)
    if start_time.save
      redirect_to project_task_path(project_id: start_time.task.project_id, task_id: start_time.task_id, id: current_user.id)
      flash[:notice] = "タスクを開始しました"
    else
      flash[:notice] = "タスクを開始できませんでした"
    end
  end

  private
  def start_time_params
    params.permit(:task_id).merge(task_id: params[:task_id])
  end
end
