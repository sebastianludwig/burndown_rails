class GraphsController < ApplicationController
  def index
    @graphs = Graph.where(:sprint_id => params[:sprint_id])
  end

  def show
    @graph = Graph.find(params[:id])
  end
end
