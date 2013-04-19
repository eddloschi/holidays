Given(/^I'm on the home page$/) do
  visit root_path
end

Given(/^today is "(.*?)"$/) do |date|
  page.execute_script "Holidays.__container__.lookup('controller:calendar').set('currentDate', moment('#{date}'))"
end
