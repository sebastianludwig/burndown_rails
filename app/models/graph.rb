class Graph < ActiveRecord::Base
  attr_accessible :label
  
  belongs_to :sprint
  has_many :data_points
  
  validates_presence_of :label
end
