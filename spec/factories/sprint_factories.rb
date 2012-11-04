FactoryGirl.define do
  factory :sprint do
    sequence(:number)
    
    factory :sprint_with_graphs do
      after_create do |sprint|
        sprint.graphs.create :label => 'Bugs'
        sprint.graphs.create :label => 'Story Points'
        sprint.graphs.create :label => 'Tasks'
      end
    end

    factory :sprint_with_graph_and_points do
      ignore do
        point_count 5
      end
      
      after_create do |sprint, evaluator|
        FactoryGirl.create_list(:graph_with_points, 1, :sprint => sprint, :point_count => evaluator.point_count)
      end
    end
  end
end