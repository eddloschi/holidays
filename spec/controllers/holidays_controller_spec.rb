require 'spec_helper'

describe HolidaysController do

  before do
    FactoryGirl.create(:holiday).save
  end

  describe "GET 'index'" do
    it "should be successful" do
      visit '/holidays.json'
      page.status_code.should == 200
    end

    it "should return holidays as root" do
      visit '/holidays.json'
      hash = page.source
      /^\{"holidays":\[\{/.match(hash).should_not == nil
    end
  end


end
