require 'spec_helper'

describe Holiday do

  before do
    @holiday = FactoryGirl.build_stubbed :christmas
  end

  it 'should have a name attribute' do
    @holiday.should be_valid
    @holiday.name = nil
    @holiday.should_not be_valid
  end

  it 'should have a schedule attribute' do
    @holiday.should be_valid
    @holiday.schedule = nil
    @holiday.should_not be_valid
  end

  it 'should have a recurrent attribute' do
    @holiday.should be_valid
    @holiday.recurrent = nil
    @holiday.should_not be_valid
  end

  it 'should have a next ocurrence when retrieved' do
    @holiday.send(:create_next_occurrence)
    @holiday.should respond_to :next_occurrence
  end

  it 'should return a valid next occurence' do
    day = @holiday.schedule[:day_of_month]
    month = @holiday.schedule[:month_of_year]
    today = Date.today
    if today.day > day and today.month >= month
      today >> 12
    end
    date = Date.new(today.year, month, day)
    @holiday.send(:create_next_occurrence)
    @holiday.next_occurrence.should == date
  end

end
