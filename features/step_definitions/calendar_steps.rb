Then(/^I should see a "(.*?)" element$/) do |selector|
  page.should have_selector selector
end

Then(/^I should see the "(.*?)" month$/) do |month|
  if month == 'present'
    month = I18n.l Date.today, format: '%b'
  end
  page.find("#month-id").should have_text month
end

Then(/^I should see the "(.*?)" year$/) do |year|
  if year == 'present'
    year = Date.today.strftime '%Y'
  end
  page.find("#year-id").should have_text year
end

Then(/^I should see matching weekdays$/) do
  first_day = Date.today.at_beginning_of_month
  last_day = Date.today.at_end_of_month
  @rows = (first_day.wday + last_day.day - 1) / 7 + 1
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

When(/^I click on the "(.*?)" button$/) do |button|
  page.find("#{button}").click
end
