class ProjectsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @projects = Project.all
    @tasks = Task.all
  end

  def new
    @project = Project.new
    # @project.join_project_users.new
    @users = []
    User.all.each do |user|
      @users << [user.name, user.id]
    end
  end

  def create
    Project.create(project_params)
    redirect_to root_path
    # redirect_to project_path(@project.id)
  end

  def show
    @project = Project.find(params[:id])
    @all_users = User.all
    @users = []
    User.all.each do |user|
      @users << [user.name, user.id]
    end
  end

  def edit
    # binding.pry
    @project = Project.find(params[:id])
    @users = []
    User.all.each do |user|
      @users << [user.name, user.id]
    end
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

  def search
    @projects = Project.search(params[:keyword])
    binding.pry
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
