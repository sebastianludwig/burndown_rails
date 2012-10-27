class SprintsController < ApplicationController
  def index
    @sprints = Sprint.all
  end

  def show
    @sprint = Sprint.find_by_id(params[:id])
  end

  def create
    @sprint = Sprint.new
    @sprint.number = Sprint.current.number + 1
    
    if @sprint.save
      flash[:notice] = "New sprint started"
      redirect_to @sprint
    else
      flash[:error] = "Unable to start sprint"
      redirect_to sprints_path
    end
  end
end
