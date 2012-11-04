class DataPointsController < ApplicationController
  def index
    @points = Graph.find(params[:graph_id]).points
  end

  def create
    graph = Graph.find(params[:graph_id])
    
    point = graph.points.find_by_date(params[:date])
    if point
      if !point.update_attributes(:value => params[:value], :date => params[:date])
        flash[:error] = "Data point for #{params[:date]} already exists. Attempt to update failed."
      end
    else
      if !graph.points.create(:value => params[:value], :date => params[:date])
        flash[:error] = "Data point could not be created."
      end
    end
    
    redirect_to sprint_graph_url(graph.sprint, graph)
  end

  def destroy
    point = DataPoint.find(params[:id])
    point.destroy
    
    graph = Graph.find(params[:graph_id])
    
    redirect_to sprint_graph_url(graph.sprint, graph)
  end
end
