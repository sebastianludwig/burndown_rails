require 'spec_helper'

describe 'sprint request' do
  describe '#index' do
    before :each do
      @sprints = create_list(:sprint, 10)
      visit(sprints_path)
    end
    
    it 'shows all sprints' do
      page.should have_content('Sprints')
      page.should have_content('Number')
      page.should have_content @sprints.last.number
    end
    
    it 'allows to start a new sprint' do
      click_on 'Start new sprint'
      page.should have_content 'New sprint started'
    end
  end
  
  describe '#show' do
    it 'lists graphs' do
      @sprint = create(:sprint_with_graphs)
      visit sprint_path(@sprint)
      
      @sprint.graphs.each do |graph|
        page.should have_content graph.label
      end
    end
  end
end