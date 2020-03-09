class HomeController < ApplicationController
  def index
    @tasks = current_user.tasks.order(created_at: :desc)
  end
end
