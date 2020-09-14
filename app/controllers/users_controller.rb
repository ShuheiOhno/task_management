class UsersController < ApplicationController
  def index
    @user_tasks = Task.where(user_id: current_user.id)
    @comments = Comment.all
  end
  
  def show
    @owner_projects = Project.where(user_id: current_user.id)
    @projects = []
    Project.all.each do |project|
      project.users.each do |join_user|
        if join_user.id == current_user.id
          @projects << project
        end
      end
    end
    @receive_user_comment = UserComment.where(to_user_id: current_user.id)
    @send_user_comment = UserComment.where(user_id: current_user.id)
    
    @comments = Comment.all
  end

  def user_message
    @owner_projects = Project.where(user_id: current_user.id)
    @projects = []
    Project.all.each do |project|
      project.users.each do |join_user|
        if join_user.id == current_user.id
          @projects << project
        end
      end
    end
    @receive_user_comment = UserComment.where(to_user_id: current_user.id)
    @send_user_comment = UserComment.where(user_id: current_user.id)
    
    @comments = Comment.all

    # プロジェクト、タスクメッセージ用
    @to_user_project_comments = ProjectComment.where(to_user_id: current_user.id)
    @to_user_task_comments = TaskComment.where(to_user_id: current_user.id)


  end
end
