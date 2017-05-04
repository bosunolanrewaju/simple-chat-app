FactoryGirl.define do
  factory :chat do
    receiver
    sender
    message Faker::Lorem.paragraph
  end
end
