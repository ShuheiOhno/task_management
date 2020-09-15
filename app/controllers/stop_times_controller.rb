class StopTimesController < ApplicationController
  def index
  end

  def new
    @stop_time = StopTime.new
  end
  
  def create
    StopTime.create(stop_time_params)
  end

  private
  def stop_time_params
    params.permit(:task_id).merge(task_id: params[:task_id])
  end
end
