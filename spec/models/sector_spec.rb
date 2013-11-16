require "spec_helper"

describe Sector do
  it { should have_and_belong_to_many(:countries) }
  it { should have_many(:jobs) }
end