object false

node(:sprints) do
  @sprints.map do |sprint|
    partial "sprints/show", :object => sprint, :view_path => 'app/views/api/v1'
  end
end

# collection @sprints, :object_root => false
# 
# extends "sprints/show"
