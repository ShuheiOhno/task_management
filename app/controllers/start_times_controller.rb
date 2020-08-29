class StartTimesController < ApplicationController
  def index
  end

  def new
    @start_time = StarsTime.new
  end
  
  def create
    StartTime.create(start_time_params)
  end

  private
  def start_time_params
    params.permit(:task_id)
  end
end
