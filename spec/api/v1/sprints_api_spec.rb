require 'spec_helper'

describe Api::V1::SprintsController, :type => :controller do
  describe "GET show" do
    before :each do
      @sprint = create(:sprint_with_graph_and_points)
      Sprint.stub(:find) { @sprint }
    end
        
    it "returns http success" do
      get 'show', :id => 4, :format => :json
      response.should be_success
    end
    
    describe "JSON" do
      render_views
      
      it "returns JSON" do
        get 'show', :id => 0, :format => :json
        json = JSON.parse(response.body)
        
        expect(json["sprint"]["id"]).to be == @sprint.id
        expect(json["sprint"]["number"]).to be == @sprint.number
        expect(json["sprint"]["graphs"].count).to be == @sprint.graphs.count
      end
    end
  end
end