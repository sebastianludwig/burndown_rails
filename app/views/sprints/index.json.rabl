object false

node(:sprints) do
  @sprints.map do |sprint|
    partial "sprints/show", :object => sprint
  end
end

# collection @sprints, :object_root => false
# 
# extends "sprints/show"
