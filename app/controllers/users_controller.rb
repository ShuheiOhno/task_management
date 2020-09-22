class UsersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @user_tasks = Task.where(user_id: current_user.id)
    @comments = Comment.all

    @complete_tasks = []
    @user_tasks.each do |complete_task|
      if complete_task.stop_time
        @complete_tasks << complete_task
      end
    end

    @no_complete_tasks = []
    @user_tasks.each do |no_complete_task|
      if no_complete_task.stop_time == nil
        @no_complete_tasks << no_complete_task
      end
    end
  end
  
  def show
    if user_signed_in? == false
      redirect_to "/users/sign_in"
    else
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

   def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
