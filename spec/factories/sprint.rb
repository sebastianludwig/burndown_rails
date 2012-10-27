FactoryGirl.define do
  factory :sprint do
    sequence(:number)
    
    factory :sprint_with_graphs do
      after_create do |sprint|
        sprint.graphs.create :label => 'Bugs'
        sprint.graphs.create :label => 'Story points'
        sprint.graphs.create :label => 'Tasks'
      end
      
      after_build do |sprint|
        sprint.graphs.build :label => 'Bugs'
        sprint.graphs.build :label => 'Story points'
        sprint.graphs.build :label => 'Tasks'
      end
    end
  end
end