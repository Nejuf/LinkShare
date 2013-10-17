require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it "must have username" do
    FactoryGirl.build(:user, :username => nil).should_not be_valid
  end

  it "must not permit same username" do
     #user =  FactoryGirl.build(:user)
    #should validate_uniqueness_of(:username, password: "1234")
  end

  it "must have password" do
    FactoryGirl.build(:user, :password => nil).should_not be_valid
  end
  it "must not store password" do
    5.times{FactoryGirl.create(:user)}
    User.find(2).password.should be_nil
  end

  it "should have session_token" do
    FactoryGirl.create(:user).session_token.should_not be_nil
  end

  it "should find_by_credentials" do
    FactoryGirl.create(:user, username: "Joe777", password: "123456abc")
    User.find_by_credentials("Joe777", "123456abc").should_not be_nil
  end

  describe "mass assignment" do
    it {should_not allow_mass_assignment_of(:password_digest)}
  end

  describe "associations" do
    it {should have_many(:links)}
  end
end
