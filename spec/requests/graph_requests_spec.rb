require 'spec_helper'

describe 'graph request' do
  describe 'index' do
    it 'lists graphs' do
      sprint = create(:sprint_with_graphs)
      
      visit sprint_graphs_path(sprint)
      
      sprint.graphs.each do |graph|
        page.should have_content graph.label
      end
    end
  end
end