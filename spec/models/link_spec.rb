require 'spec_helper'

describe Link do
  it "must have title" do
    FactoryGirl.build(:link, title: nil).should_not be_valid
  end

  it "must have url" do
    FactoryGirl.build(:link, url: nil).should_not be_valid
  end

  describe "associations" do
    it "must have user" do
      should belong_to(:user)
    end

    it "must have subs" do
      should have_many(:subs)
    end
  end

end
