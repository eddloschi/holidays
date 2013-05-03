class HolidaysController < ApplicationController
  def index
    year, month = params[:ym].split '-'
    # get non recurrrent holidays
    @holidays = Holiday.where('schedule.month_of_year' => month.to_i).to_a
    #get recurrent holidays
    Holiday.where(recurrent: true).each do |holiday|
      date = Date.new(year.to_i, month.to_i, 1)
      schedule = IceCube::Schedule.from_hash(holiday.schedule)
      @holidays << holiday if schedule.occurs_between?(date, date.end_of_month)
    end
    # order by date of next occurrence
    @holidays.sort! { |h1,h2| h1.next_occurrence <=> h2.next_occurrence }
    render json: @holidays
  end
end
