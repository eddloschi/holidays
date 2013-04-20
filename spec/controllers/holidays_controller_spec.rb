require 'spec_helper'

describe HolidaysController do

  before do
    @holiday = FactoryGirl.create(:holiday)
  end

  describe "GET 'index'" do
    it 'should return a complete and valid holiday' do
      visit '/holidays/2013-12'
      hash = page.source
      /\{"holidays":\[\{"_id":"#{@holiday.id}","name":"Christmas","recurrent":false,"schedule":\{"month_of_year":12,"day_of_month":25\}\}\]\}/.match(hash).should_not == nil
    end
  end


end
