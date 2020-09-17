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
    binding.pry
    if new_project.save
      

      params[:project][:user_ids].each do |join_user_id|
        if join_user_id != nil
          JoinProjectUser.create(user_id: join_user_id, project_id: new_project.id)
        end
      end
      redirect_to project_path(id: new_project.id)
      flash[:notice] = "プロジェクトを作成しました。"
    else
      redirect_to new_project_path
      flash[:notice] = "プロジェクトの作成に失敗しました。"
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

  def complete
    project = Project.find(params[:id])
    if project.update(complete_project_params)
      if project.complete_id == 1
        redirect_to project_path(id: project.id)
        flash[:notice] = "プロジェクトを終了（完遂）しました。"
      else
        redirect_to project_path(id: project.id)
        flash[:notice] = "プロジェクトを中止しました。"
      end
    else
      redirect_to edit_project_path(project.id)
      flash[:notice] = "編集に失敗しました。"
    end
  end

private
  def project_params
    params.require(:project).permit(
      :title, :explanation, :deadline,
      :user_id, :complete_id
    ).merge(user_id: current_user.id)
  end

  def complete_project_params
    params.permit(
      :title, :explanation, :deadline,
      :user_id, :complete_id
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
