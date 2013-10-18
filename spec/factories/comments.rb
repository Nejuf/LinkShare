# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'
FactoryGirl.define do
  factory :comment do
    sequence(:parent_comment_id) {|n| "#{n}"}
    sequence(:link_id) {|n| "#{n}"}
    body Faker::Lorem.paragraph
  end
end
