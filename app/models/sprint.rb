class Sprint < ActiveRecord::Base
  attr_accessible :number
  
  has_many :graphs
  
  def self.current
    Sprint.order('number').last
  end
  
end
