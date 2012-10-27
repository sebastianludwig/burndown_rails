require 'spec_helper'

describe 'graph routing' do
  it 'routes /sprints/:sprint_id/graphs to graphs#index' do
    expect(:get => "/sprints/4/graphs").to route_to('graphs#index', :sprint_id => '4')
  end
  
  it 'routes /sprints/:sprint_id/graphs/:id' do
    expect(:get => '/sprints/4/graphs/2').to route_to('graphs#show', :sprint_id => '4', :id => '2')
  end
end