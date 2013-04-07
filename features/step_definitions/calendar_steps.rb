When(/^I enter the page$/) do
  visit root_path
end

Then(/^I should see a calendar element$/) do
  page.should have_selector 'div#calendar-id'
end

Then(/^I should see the current month$/) do
  current_month = I18n.l Date.today, format: '%b'
  within 'span#month-id'
    page.should have_content current_month
end

Then(/^I should see the current year$/) do
  current_year = Date.today.strftime '%Y'
  within 'span#year-id'
    page.should have_content current_year
end
