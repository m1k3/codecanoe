# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :build_configuration do
    name "default"
    commands "bundle exec rake"
  end
end
