class Sprint < ActiveRecord::Base
  attr_accessible :number
  
  def self.current
    Sprint.order('number').last
  end
  
end
