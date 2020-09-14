class JoinProjectUsersController < ApplicationController

  def new
    @join_project_user_middletable = JoinProjectUser.new
  end

  def create
    JoinProjectUser.create(join_project_user_params)
    redirect_to project_path(params[:project_id])
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private
  def join_project_user_params
    params.permit(:user_id).merge(project_id: params[:project_id])
  end
end
