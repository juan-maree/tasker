class SearchController < ApplicationController
  def index
    if params[:query].start_with?("#")
      query = params[:query].gsub("#", "")
      @tasks = Task.joins(:tags).where(tags: { name: query })
    else
      @tasks = Task.where("name like ? OR description like ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end
  end
end
