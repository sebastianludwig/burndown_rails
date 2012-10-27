require 'spec_helper'

describe DataPointsController do

  def route_parameter
    { :sprint_id => 4, :graph_id => 2, :id => 9 }
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', route_parameter
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create', route_parameter
      response.should be_success
    end
  end

  describe "DELETE 'destroy'" do
    it "returns http success" do
      delete 'destroy', route_parameter
      response.should be_success
    end
  end

end
