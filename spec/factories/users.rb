FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    password 'password'
    password_confirmation 'password'

    trait :trainer do
      after(:build) { |user| user.trainer! }
    end

    trait :admin do
      after(:build) { |user| user.admin! }
    end
  end
end
