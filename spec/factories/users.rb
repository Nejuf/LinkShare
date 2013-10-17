# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "#{n}#{Faker::Internet.user_name}"}
    password SecureRandom.urlsafe_base64[0..8]
  end
end
