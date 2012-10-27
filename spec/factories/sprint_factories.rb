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
  end
end