# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :holiday do
    name "Christmas"
    schedule({month_of_year: 12, day_of_month: 25})
    recurrent false
  end
end
