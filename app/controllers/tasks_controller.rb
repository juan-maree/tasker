class TasksController < ApplicationController
    def create
        Task.create(task_params)
        
        redirect_to root_path
    end

    private

    def task_params
        params.require(:task).permit(:title, :user_id)
    end
end
