class StopTimesController < ApplicationController

  def create
    stop_time = StopTime.create(stop_time_params)

    if stop_time.save
      redirect_to project_task_path(project_id: stop_time.task.project_id, task_id: stop_time.task_id, id: current_user.id)
      flash[:notice] = "タスクを終了しました"
    else
      flash[:notice] = "タスクを終了できませんでした"
    end
  end

  private
  def stop_time_params
    params.permit(:task_id).merge(task_id: params[:task_id])
  end
end
