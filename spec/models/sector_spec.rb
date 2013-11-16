require "spec_helper"

describe Sector do
  it { should belong_to(:country) }
  it { should have_many(:jobs) }
end