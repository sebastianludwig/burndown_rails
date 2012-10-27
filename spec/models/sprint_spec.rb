require 'spec_helper'

describe Sprint do
  describe ".current" do
    it "returns the sprint with the highest number" do
      create(:sprint, :number => 1)
      create(:sprint, :number => 2)
      create(:sprint, :number => 3)
      
      expect(Sprint.current.id).to eq(3)
    end
  end
  
  describe 'factory' do
    describe 'with graphs' do
      it 'creates three graphs' do
        create(:sprint_with_graphs)
        expect(Graph.count).to be == 3
      end
    end
  end
end
