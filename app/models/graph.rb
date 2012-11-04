class Graph < ActiveRecord::Base
  attr_accessible :label
  
  belongs_to :sprint
  has_many :points, :class_name => :DataPoint, :dependent => :destroy
  
  validates_presence_of :label
end
