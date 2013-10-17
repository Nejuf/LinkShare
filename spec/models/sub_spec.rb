require 'spec_helper'

describe Sub do

  it "must have name" do
    FactoryGirl.build(:sub, name: nil).should_not be_valid
  end

  describe "associations" do
    it {should have_many(:links)}
    it {should belong_to(:user)}
  end
end
