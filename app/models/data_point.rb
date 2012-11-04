class DataPoint < ActiveRecord::Base
  attr_accessible :date, :value
  
  belongs_to :graph
  validates_presence_of :value, :date
  validates_numericality_of :value, :only_integer => true
  
  default_scope order('date ASC')
end
