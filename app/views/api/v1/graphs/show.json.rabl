object @graph

attribute :id, :label

child :points => :points do
  attributes :value, :date
end
