class HomeController < ApplicationController
  def index
    if current_user
      @tasks = current_user.tasks.order(created_at: :desc).page(params[:page]).per(5)
    else
      redirect_to login_url
    end
  end
end
