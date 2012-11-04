class Sprint < ActiveRecord::Base
  attr_accessible :number
  
  has_many :graphs, :dependent => :destroy
  
  def self.current
    Sprint.order('number').last
  end
  
end
