class TasksController < ApplicationController
  def show
    @task = current_user.tasks.find(params[:id])
    @pending_tasks = Task.where(status: "Pending")
    @completed_tasks = Task.where(status: "Completed")
  end

  def create
    @task = Task.create(task_params)
    @task.status = "Pending"
    @task.save

    redirect_to root_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy

    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :user_id)
  end
end
