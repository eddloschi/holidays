# Read about factories at https://github.com/thoughtbot/factory_girl

sched = IceCube::Schedule.new() do |s|
  s.add_recurrence_rule(IceCube::Rule.yearly.day_of_week(:sunday => [2]).month_of_year(:may))
end

FactoryGirl.define do

  factory :christmas, class: Holiday do
    name "Christmas"
    schedule({month_of_year: 12, day_of_month: 25})
    recurrent false
  end

  factory :labor, class: Holiday do
    name "Labor Day"
    schedule({month_of_year: 5, day_of_month: 1})
    recurrent false
  end

  factory :mothers, class: Holiday do
    name "Mother's Day"
    schedule(sched.to_hash)
    recurrent true
  end

  factory :corpus_christ, class: Holiday do
    name "Corpus Christ"
    schedule({month_of_year: 5, day_of_month: 30})
    recurrent false
  end

end
