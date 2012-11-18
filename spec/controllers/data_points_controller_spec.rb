require 'spec_helper'

describe DataPointsController do
  before :each do
    @sprint = create(:sprint_with_graph_and_points, :point_count => 3)
    @graph = @sprint.graphs.first
    Graph.stub(:find) { @graph }    
  end
  
  describe "GET index" do
    before :each do
      get 'index', :sprint_id => @sprint.id, :graph_id => @sprint.graphs.first.id
    end
    
    it { should respond_with(:success) }
    it { should assign_to(:points) }
        
    it "assigns data points of sprint" do
      expect(assigns(:points).count).to be == 3
      expect(assigns(:points).first.graph.sprint).to be == @sprint
    end
  end

  describe "POST create" do
    before :each do
      @route_parameters = { :sprint_id => @sprint.id, :graph_id => @graph.id, :value => 42, :date => Date.today }
    end
    
    it "redirects to graph" do
      post 'create', @route_parameters
      response.should redirect_to sprint_graph_url(:sprint_id => @sprint.id, :id => @graph.id)
    end
    
    describe "adds a data point" do
      context "successfully" do
        it "to the graph" do
          expect { post 'create', @route_parameters }.to change(DataPoint, :count)
        end
      
        it "with the passed value" do
          post 'create', @route_parameters
          
          expect(@graph.points).to have_one_that satisfy { |point| point.value == 42 }
        end
      
        it "replaces a data point for the same day" do
          old_count = @graph.points.count
          post 'create', @route_parameters
          post 'create', @route_parameters.merge( { :value => 43 } )
          expect(@graph).to have(old_count + 1).points
          
          expect(@graph.points).to have_one_that satisfy { |point| point.value == 43 }
        end
      end
      
      context "failure" do
        it "sets flash[:error]" do
          DataPoint.any_instance.stub(:update_attributes) { false }
          post 'create', @route_parameters
          post 'create', @route_parameters
          should set_the_flash
        end
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @route_parameters = { :sprint_id => @sprint.id, :graph_id => @graph.id, :id => @graph.points.first.id }
    end
    
    it "redirects to graph" do
      delete 'destroy', @route_parameters
      response.should redirect_to sprint_graph_url(:sprint_id => @sprint.id, :id => @graph.id)
    end
    
    it "deletes the data point" do
      expect { delete 'destroy', @route_parameters }.to change(DataPoint, :count)
    end
    
  end

end
