require "spec_helper"

describe Country do
  it { should belong_to(:region) }
end