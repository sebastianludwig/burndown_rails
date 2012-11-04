require 'spec_helper'

describe 'data_point request' do
  describe '#index' do
    before :each do
      @sprint = create(:sprint_with_graph_and_points)
    end
    
    it "retruns a list of data points" do
      graph = @sprint.graphs.first
      visit sprint_graph_points_path(@sprint, graph)
      
      graph.points.each do |point|
        page.should have_content point.value
      end
    end
  end
end