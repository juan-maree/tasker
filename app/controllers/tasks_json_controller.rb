class TasksJsonController < ApplicationController
  def index
    @tasks = Task.order("created_at DESC")
    render json: @tasks
  end
end
