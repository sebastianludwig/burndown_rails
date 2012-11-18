class SprintsController < ApplicationController
  def index
    @sprints = Sprint.all
  end

  def show
    @sprint = Sprint.find(params[:id])
  end
  
  def current
    @sprint = Sprint.current
    render :show
  end

  def create
    @sprint = Sprint.new
    @sprint.number = Sprint.current ? Sprint.current.number + 1 : 1
    
    @sprint.graphs.build(:label => "Story Points")
    @sprint.graphs.build(:label => "Tasks")
    @sprint.graphs.build(:label => "Bugs")
    
    if @sprint.save
      flash[:notice] = "New sprint started"
      redirect_to @sprint
    else
      flash[:error] = "Unable to start sprint"
      redirect_to sprints_path
    end
  end
end
