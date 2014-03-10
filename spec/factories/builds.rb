# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :build do
    app nil
    build_configuration nil
    status "MyString"
    notes "MyText"
  end
end
