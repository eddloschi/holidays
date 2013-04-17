# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :holiday do
    name "MyString"
    schedule ""
    recurrent false
  end
end
