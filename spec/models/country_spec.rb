require "spec_helper"

describe Country do
  it { should belong_to(:region) }
  it { should have_and_belong_to_many(:sectors) }
end