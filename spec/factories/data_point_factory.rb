FactoryGirl.define do
  factory :data_point do
    sequence(:value)
    sequence(:date) { |n| Date.today - (n + 1).days }
  end
end