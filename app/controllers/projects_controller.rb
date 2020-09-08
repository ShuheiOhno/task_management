class ProjectsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    # @project.join_project_users.new
  end

  def create
    Project.create(project_params)
    redirect_to root_path
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    project = Project.find(params[:id])
    project.update(project_params)
    redirect_to root_path
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to root_path
  end

private
  def project_params
    params.require(:project).permit(
      :title, :explanation, :deadline, :user_id,
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
