require 'spec_helper'

describe DataPoint do
  it { should belong_to(:graph) }
  it { should validate_presence_of(:value) }
  it { should validate_numericality_of(:value) }
  it { should validate_presence_of(:date) }
end
