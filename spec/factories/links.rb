# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :link do
    title Faker::Lorem.words(3)
    body Faker::Lorem.paragraph
    url Faker::Internet.domain_name
    sequence :user do |n|
      FactoryGirl.create(:user)
    end
  end
end
