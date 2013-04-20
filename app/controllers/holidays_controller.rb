class HolidaysController < ApplicationController
  def index
    @holidays = Holiday.all
    render json: @holidays
  end
end
