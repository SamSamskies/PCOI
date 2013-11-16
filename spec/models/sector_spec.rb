require "spec_helper"

describe Sector do
  it { should have_many(:jobs) }
end