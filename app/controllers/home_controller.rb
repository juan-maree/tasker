class HomeController < ApplicationController
  def index
    @tasks = current_user.tasks.order(created_at: :desc).page(params[:page]).per(5)
  end
end
