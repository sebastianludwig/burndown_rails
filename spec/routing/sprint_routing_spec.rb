require 'spec_helper'

describe 'Sprint routing' do
  it "routes /sprints" do
    expect(:get => "/sprints").to be_routable
  end
  
  describe 'show' do
    it "routes /sprint/:number" do
      expect(:get => "/sprints/4").to route_to("sprints#show", :id => "4")
    end
    
    it "does not allow non-digit IDs" do
      expect(:get => "/sprints/bam").not_to be_routable
    end
  end
  
  
  describe 'creation' do
    it "does not have a new path" do
      expect(:get => "/sprints/new").not_to be_routable
    end
    
    it "post /sprints to sprints#create" do
      expect(:post => "/sprints").to route_to("sprints#create")
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