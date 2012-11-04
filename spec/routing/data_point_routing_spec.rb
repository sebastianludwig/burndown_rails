require 'spec_helper'

describe 'DataPoint routing' do
  it 'does not route GET of a member' do
    expect(:get => "/sprints/4/graphs/2/data_points/9").not_to be_routable
  end
  
  it 'does not allow non-digit IDs' do
    expect(:delete => "/sprints/4/graphs/2/data_points/bam").not_to be_routable
  end
  
  it 'routes GET /sprints/4/graphs/2/data_points to data_points#index' do
    expect(:get => '/sprints/4/graphs/2/data_points').to route_to('data_points#index', :sprint_id => '4', :graph_id => '2' )
  end
  
  it 'routes DELETE /sprints/4/graphs/2/data_points/9 to data_points#destroy' do
    expect(:delete => "/sprints/4/graphs/2/data_points/9").to route_to('data_points#destroy', :sprint_id => '4', :graph_id => '2', :id => '9')
  end
end