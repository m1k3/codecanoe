FactoryGirl.define do
  factory :user do
    email 'bob@example.com'
    password 'password'

    trait :anna do
      email 'anna@example.com'
    end
  end
end
