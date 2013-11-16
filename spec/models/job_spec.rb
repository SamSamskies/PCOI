require "spec_helper"

describe Job do
  it { should belong_to(:country) }
  it { should belong_to(:sector) }
end