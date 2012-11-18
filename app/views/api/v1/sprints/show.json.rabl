object @sprint

attribute :id, :number

child :graphs do
  extends "graphs/show", :view_path => 'app/views/api/v1'
end
