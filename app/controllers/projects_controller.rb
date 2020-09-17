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
    new_project = Project.new(project_params)
    if new_project.save
      redirect_to project_path(id: new_project.id)
    else
      redirect_to new_project_path
      flash[:notice] = "登録に失敗しました。"
    end
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
    @project = Project.find(params[:id])
    @users = []
    User.all.each do |user|
      @users << [user.name, user.id]
    end
  end

  def update
    project = Project.find(params[:id])
    if project.update(project_params)
      redirect_to project_path(id: project.id)
      flash[:notice] = "編集しました。"
    else
      redirect_to edit_project_path(project.id)
      flash[:notice] = "編集に失敗しました。"
    end
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    flash[:notice] = "プロジェクトを削除しました"
    redirect_to user_path(id: current_user.id)
  end

  def search
    @projects = Project.search(params[:keyword])
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
