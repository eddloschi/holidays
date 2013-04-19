require 'spec_helper'

describe Holiday do

  before do
    @holiday = FactoryGirl.create :holiday
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



end
