require 'spec_helper'

describe 'routing' do
  it "routes /sprints" do
    expect(:get => "/sprints").to be_routable
  end
  
  it "routes /sprint/:number to sprints#show" do
    expect(:get => "/sprints/4").to route_to(
      :controller => "sprints",
      :action => "show",
      :id => "4"
    )
  end
  
  describe 'creation' do
    it "does not have a new path" do
      expect(:get => "/sprints/new").not_to be_routable
    end
    
    it "post /sprints to sprints#create" do
      expect(:post => "/sprints").to route_to(
        :controller => "sprints", 
        :action => "create"
      )
    end
  end
  
  describe 'editing' do
    it "does not allow editing" do
      expect(:get => "/sprints/4/edit").not_to be_routable
    end
  
    it "does not allow updating" do
      expect(:put => "/sprints/4").not_to be_routable
    end
  end  
end