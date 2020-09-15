class TasksController < ApplicationController

  def index
    @tasks = Task.where(project_id: params[:project_id])
  end

  def new
    @task = Task.new
  end
  
  def create
    Task.create(task_params)
    redirect_to root_path
  end

  def show
    # @task = Task.find(params[:id])
    @task = Task.find(params[:task_id])
  end

  def edit
    @task = Task.find(params[:task_id])
  end
  
  def update
    task = Task.find(params[:id])
    # task[:start_time] = Time.now
    task.update(edit_task_params)
    redirect_to root_path
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to root_path
  end

  private
  def task_params
    params.permit(
    :title, :cost_time, :to_user_id,
    :estimated_time, :complete_id,
    ).merge(user_id: current_user.id, project_id: params[:project_id])
  end

  def edit_task_params
    # require(:task)を入れることで、edit_task_paramsが空ではなくなった
    params.require(:task).permit(
      :title, :cost_time,
      :estimated_time, :complete_id,
      # :start_time, :stop_time
      )
  end

end
