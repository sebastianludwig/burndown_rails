require 'spec_helper'

describe Api::V1::DataPointsController, :type => :controller do
  describe "POST create" do
    context "success" do
      before :each do
        @sprint = create(:sprint_with_graph_and_points, :point_count => 3)
        @graph = @sprint.graphs.first
        Graph.stub(:find) { @graph }
        
        @route_parameters = { :sprint_id => @sprint.id, :graph_id => @graph.id, :value => 4, :date => Date.today }
      end
      
      it "should succeed" do
        post 'create', @route_parameters
        should respond_with :success
      end
      
      it "adds a point to the graph" do
        expect { post 'create', @route_parameters }.to change(DataPoint, :count)
      end

      it "with the passed value" do
        post 'create', @route_parameters.merge( { :value => 42 } )
      
        expect(@graph.points).to have_one_that conforms_to proc { |point| point.value == 42 }
      end
      
      it "replaces a data point for the same day" do
        old_count = @graph.points.count
        post 'create', @route_parameters
        post 'create', @route_parameters.merge( { :value => 43 } )
        expect(@graph).to have(old_count + 1).points
      
        expect(@graph.points).to have_one_that conforms_to proc { |point| point.value == 43 }
      end
    end
    
    context "failure" do
      context "requires value parameter" do
        before :each do
          post 'create', { :sprint_id => 10, :graph_id => -1000, :date => Date.today }
        end
        
        it { should respond_with :bad_request }
        
        it "reports error" do
          json = JSON.parse(response.body)

          expect(json["error"]["param"]).to be == "value"
        end
      end
      
      context "requires date parameter" do
        before :each do
          post 'create', { :sprint_id => 10, :graph_id => -1000, :value => 4 }
        end
        
        it { should respond_with :bad_request }
        
        it "reports error" do
          json = JSON.parse(response.body)

          expect(json["error"]["param"]).to be == "date"
        end
      end
      
      it "404 with non existing graph" do
        post 'create', { :sprint_id => 10, :graph_id => -1000, :value => 4, :date => Date.today }
        should respond_with :not_found
      end
      
      context "on internal server error" do
        before :each do
          @sprint = create(:sprint_with_graph_and_points, :point_count => 3)
          @graph = @sprint.graphs.first
          Graph.stub(:find) { @graph }
          
          @route_parameters = { :sprint_id => @sprint.id, :graph_id => @graph.id, :value => 4, :date => Date.today }
        end
        
        context "when updating" do
          before :each do
            post 'create', @route_parameters
            DataPoint.any_instance.stub(:update_attributes) { false }
            post 'create', @route_parameters
          end
          
          it { should respond_with :internal_server_error }
          
          it "reports error" do
            json = JSON.parse(response.body)

            expect(json["error"]["message"]).to be
          end
        end        
      end
    end
  end
end