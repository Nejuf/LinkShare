require 'spec_helper'

describe Comment do
  it "must have body" do
    FactoryGirl.build(:comment, body: nil).should_not be_valid
  end

  describe "associations" do
    it "must have link"do
      FactoryGirl.build(:comment, link_id: nil).should_not be_valid
    end

    it "must have author"do
      FactoryGirl.build(:comment, user_id: nil).should_not be_valid
    end
  end

end
