class TasksController < ApplicationController
  def show
    @task = current_user.tasks.find(params[:id])
  end

  def create
    Task.create(task_params)

    redirect_to root_path
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy

    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :user_id)
  end
end
