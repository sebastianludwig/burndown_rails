require 'spec_helper'

describe DataPoint do
  it { should belong_to(:graph) }
end
