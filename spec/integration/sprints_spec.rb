require 'spec_helper'

describe 'sprint managing' do
  describe 'listing sprints' do
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
end