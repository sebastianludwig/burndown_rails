FactoryGirl.define do
  factory :graph do
    label 'Graph'
    
    factory :graph_with_points do
      ignore do
        point_count 5
      end
      
      after_create do |graph, evaluator|
        FactoryGirl.create_list(:data_point, evaluator.point_count, :graph => graph)
      end
    end
  end
end