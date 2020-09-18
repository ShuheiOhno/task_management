class JoinProjectUsersController < ApplicationController

  def new
    @join_project_user_middletable = JoinProjectUser.new
  end

  def create
    join_user = JoinProjectUser.new(join_project_user_params)
    if join_user.save
      flash[:notice] = "ユーザーを追加しました"
      redirect_back(fallback_location: project_path(id: join_user.project_id))
    else
      flash[:notice] = "ユーザーを追加できませんでした"
      redirect_back(fallback_location: project_path(id: join_user.project_id))
    end
    
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
