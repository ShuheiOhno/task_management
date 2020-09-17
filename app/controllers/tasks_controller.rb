class TasksController < ApplicationController

  def index
    @tasks = Task.where(project_id: params[:project_id])
  end

  def new
    @task = Task.new
  end
  
  def create
    task = Task.new(task_params)
    if task.save
      redirect_to project_task_path(project_id: task.project_id, task_id: task.id, id: current_user.id)
      flash[:notice] = "タスクを保存しました"
    else
      redirect_to project_path(id: task.project_id)
      flash[:notice] = "タスクの保存に失敗しました"
    end
  end

  def show
    @task = Task.find(params[:task_id])
  end

  def edit
    @task = Task.find(params[:task_id])
  end
  
  def update
    task = Task.find(params[:id])
    if task.update(edit_task_params)
      redirect_to project_task_path(project_id: task.project_id, task_id: task.id, id: current_user.id)
      flash[:notice] = "タスクを編集しました"
    else
      redirect_to edit_project_task_path(project_id: task.project_id, task_id: task.id, id: current_user.id)
      flash[:notice] = "タスクの編集に失敗しました"
    end
  end

  def destroy
    
    task = Task.find(params[:task_id])
    task.destroy
    flash[:notice] = "タスクを削除しました"
    redirect_to users_path
  end

  def search
    @tasks = Task.search(params[:keyword])
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
