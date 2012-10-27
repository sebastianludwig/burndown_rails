require 'spec_helper'

describe Graph do
  it { should belong_to(:sprint) }
  it { should validate_presence_of(:label) }
end
