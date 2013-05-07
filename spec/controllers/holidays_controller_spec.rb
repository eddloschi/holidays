require 'spec_helper'

describe HolidaysController do

  before do
    @holiday = FactoryGirl.create(:christmas)
  end

  describe "GET 'index'" do
    it 'should return a complete and valid christmas holiday' do
      visit '/holidays/2013-12'
      hash = page.source
      /\{"holidays":\[\{"_id":"#{@holiday.id}","name":"Christmas","next_occurrence":"2013-12-25T00:00:00Z","recurrent":false,"schedule":\{"month_of_year":12,"day_of_month":25\}\}\]\}/.match(hash).should_not == nil
    end

    it 'should return works day and mothers day' do
      labor = FactoryGirl.create(:labor)
      mothers = FactoryGirl.create(:mothers)
      corpus_christ = FactoryGirl.create(:corpus_christ)

      visit '/holidays/2013-05'
      hash = page.source

      /\{"holidays":\[\{"_id":"#{labor.id}","name":"Labor Day","next_occurrence":"2013-05-01T00:00:00Z","recurrent":false,"schedule":\{"month_of_year":5,"day_of_month":1\}\}.+\]\}/.match(hash).should_not == nil
      /\{"holidays":\[.+\{"_id":"#{mothers.id}","name":"Mother's Day","next_occurrence":"2013-05-12T\d\d:\d\d:\d\dZ","recurrent":true,"schedule":\{"start_date".+\}\}.+\]\}/.match(hash).should_not == nil
      /\{"holidays":\[.+\{"_id":"#{corpus_christ.id}","name":"Corpus Christ","next_occurrence":"2013-05-30T00:00:00Z","recurrent":false,"schedule":\{"month_of_year":5,"day_of_month":30\}\}\]\}/.match(hash).should_not == nil
    end

  end


end
