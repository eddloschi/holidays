Given(/^the following holiday exists:$/) do |table|
  table.map_column!(:schedule) { |str_schedule| eval str_schedule }
  table.hashes.each do |holiday|
    FactoryGirl.create(:holiday, holiday).save
  end
end

Then(/^I should see the following list:$/) do |table|
  within 'div#holidays-id' do
    table.hashes.each do |attrs|
      page.should have_text attrs["name"]
      page.should have_text attrs["date"]
    end
  end
end

Then(/^I should see the following text: "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
