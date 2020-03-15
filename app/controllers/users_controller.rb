class UsersController < ApplicationController
    def show
        @tasks = current_user.tasks.order(created_at: :desc)
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        current_user.update(user_params)
        redirect_to current_user
    end

    private

    def user_params
        params.require(:user).permit(:email, :avatar)
    end
end
