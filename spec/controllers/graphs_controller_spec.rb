require 'spec_helper'

describe GraphsController do

  def route_parameter
    { :sprint_id => '4', :id => 2 }
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', route_parameter
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', route_parameter
      response.should be_success
    end
  end

end
