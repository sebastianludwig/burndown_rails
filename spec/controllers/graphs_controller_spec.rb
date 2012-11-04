require 'spec_helper'

describe GraphsController do

  describe "GET index" do
    before :each do
      @sprints = create_list(:sprint_with_graphs, 5)
    end
    
    it "returns http success" do
      get 'index', :sprint_id => 4
      response.should be_success
    end
    
    it 'assigns graphs' do
      get 'index', :sprint_id => 4
      expect(assigns(:graphs)).to be
    end
    
    it 'assigns graphs of sprint' do
      get 'index', :sprint_id => @sprints.last.id
      expect(assigns(:graphs).count).to be == 3
    end
  end

  describe "GET show" do
    before :each do
      graph = create(:graph)
      Graph.stub(:find) { graph }
    end
    
    it "returns http success" do
      get 'show', { :sprint_id => '4', :id => 2 }
      response.should be_success
    end
    
    it 'assigns graph' do
      get 'show', { :sprint_id => '4', :id => 2 }
      expect(assigns(:graph)).to be
    end
  end

end
