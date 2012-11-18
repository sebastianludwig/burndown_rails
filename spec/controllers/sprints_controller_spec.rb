require 'spec_helper'

describe SprintsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    before :each do
      @sprint = create(:sprint_with_graph_and_points)
      Sprint.stub(:find) { @sprint }
    end
        
    it "returns http success" do
      get 'show', :id => 4
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
  
  describe "POST create" do
    context "success" do
      before :each do
        @sprint = build(:sprint)
        Sprint.stub(:new) { @sprint }
        post :create
      end
      
      it "redirects" do
        response.should redirect_to sprint_path(@sprint)
      end
      
      it "creates graphs" do
        @sprint.graphs.count.should > 0
      end
    end
    
    context "failure" do
      before :each do
        @sprint = stub_model(Sprint, :save => false)
        Sprint.stub(:new) { @sprint }
        post :create
      end
      
      it "redirects" do
        response.should redirect_to sprints_path
      end
      
      it "sets flash message" do
        flash[:error].should_not be_empty
      end
    end
  end

end
