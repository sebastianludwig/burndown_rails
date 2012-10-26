class DataPoint < ActiveRecord::Base
  attr_accessible :date, :value
  
  belongs_to :graph
end
