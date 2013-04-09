When(/^I enter the page$/) do
  visit root_path
end

Then(/^I should see a calendar element$/) do
  page.should have_selector 'div#calendar-id'
end

Then(/^I should see the current month$/) do
  current_month = I18n.l Date.today, format: '%b'
  within 'span#month-id' do
    page.should have_text current_month
  end
end

Then(/^I should see the current year$/) do
  current_year = Date.today.strftime '%Y'
  within 'span#year-id' do
    page.should have_content current_year
  end
end

Then(/^I should see matching weekdays$/) do
  first_day = Date.today.at_beginning_of_month
  last_day = Date.today.at_end_of_month
  rows = first_day.wday + last_day.day <= 35 ? 4 : 5
  current_day = first_day - first_day.wday
  present_month = Date.today.month
  rows.times do |r|
    7.times do |c|
      element = page.find("##{r}-#{c}")
      element.should have_text current_day.day.to_s
      if current_day.month == present_month
        element["class"].should include "enabled"
        element["class"].should_not include "disabled"
      else
        element["class"].should include "disabled"
        element["class"].should_not include "enabled"
      end
      current_day += 1
    end
  end
end

Then(/^I should see the correct rows amount$/) do
  pending # express the regexp above with the code you wish you had
end

