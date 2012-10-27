require 'spec_helper'

describe 'graph request' do
  before :each do
    @sprint = create(:sprint_with_graphs)
  end
  
  describe '#index' do
    it 'lists graph labels' do
      visit sprint_graphs_path(@sprint)
      
      @sprint.graphs.each do |graph|
        page.should have_content graph.label
      end
    end
  end
  
  describe '#show' do
    it 'shows the graph label' do
      graph = @sprint.graphs.first
      visit sprint_graph_path(@sprint, graph)
      
      page.should have_content graph.label
    end
  end
end