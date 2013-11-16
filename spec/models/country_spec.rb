require "spec_helper"

describe Country do
  it { should belong_to(:region) }
  it { should have_many(:sectors) }
end