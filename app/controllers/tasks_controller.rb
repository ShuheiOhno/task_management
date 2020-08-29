class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end
  
  def create
    # binding.pry
    Task.create!(task_params)
    redirect_to root_path
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    binding.pry
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
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
    :title, :cost_time,
    :estimated_time, :complete_id
    ).merge(user_id: current_user.id, project_id: params[:project_id])
  end

end
