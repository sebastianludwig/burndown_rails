require 'spec_helper'

describe 'sprint request' do
  describe '#index' do
    before :each do
      @sprints = create_list(:sprint, 10)
      visit(sprints_path)
    end
    
    it 'shows all sprints' do
      expect(page).to have_content('Sprints')
      expect(page).to have_content('Number')
      expect(page).to have_content @sprints.last.number
    end
    
    it 'allows to start a new sprint' do
      click_on 'Start new sprint'
      expect(page).to have_content 'New sprint started'
    end
  end
  
  describe '#show' do
    it 'lists graphs' do
      sprint = create(:sprint_with_graphs)
      visit sprint_path(sprint)
      
      sprint.graphs.each do |graph|
        expect(page).to have_content graph.label
      end
    end
  end
  
  describe '#current' do
    it 'shows the most recent one' do
      create(:sprint, :number => 9)
      create(:sprint, :number => 8)
      
      visit current_sprints_path
      
      expect(page).to have_content "Sprint 9"
    end
  end
end