Given(/^I'm on the home page$/) do
  visit root_path
end

Then(/^I should see a "(.*?)" element$/) do |arg1|
  page.should have_selector arg1
end

Then(/^I should see the present month$/) do
  current_month = I18n.l Date.today, format: '%b'
  within 'span#month-id' do
    page.should have_text current_month
  end
end

Then(/^I should see the present year$/) do
  current_year = Date.today.strftime '%Y'
  within 'span#year-id' do
    page.should have_content current_year
  end
end

Then(/^I should see matching weekdays$/) do
  first_day = Date.today.at_beginning_of_month
  last_day = Date.today.at_end_of_month
  @rows = nil
  if first_day.wday + last_day.day <= 28
    @rows = 4
  elsif first_day.wday + last_day.day <= 35
    @rows = 5
  else
    @rows = 6
  end
  current_day = first_day - first_day.wday
  present_month = Date.today.month
  @rows.times do |r|
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
  within '#calendar-id tbody' do
    page.all('tr').count.should == @rows
  end
end

Given(/^today is "(.*?)"$/) do |arg1|
  page.execute_script "Holidays.__container__.lookup('controller:calendarIndex').set('currentDate', moment('#{arg1}'))"
end

When(/^I click on the "(.*?)" button$/) do |arg1|
  page.find("#{arg1}").click
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.find("#month-id").should have_text arg1
end
