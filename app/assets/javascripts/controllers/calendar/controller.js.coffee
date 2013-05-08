Holidays.CalendarController = Ember.ArrayController.extend
  holidays: (->
    ym = @get('currentDate').format('YYYY-MM')
    Holidays.Holiday.find({arg: ym})
  ).property('currentDate')

  currentDate: moment()

  currentMonthName: (->
    @get('currentDate').format('MMM')
  ).property('currentDate')

  currentYear: (->
    @get('currentDate').format('YYYY')
  ).property('currentDate')

  weekDays: moment()._lang._weekdaysShort

  monthDays: (->
    currentDay = moment(@get('currentDate')).startOf 'month'
    currentMonth = currentDay.month()
    rows = Math.floor((currentDay.day() + moment(currentDay).endOf('month').date() - 1) / 7)
    currentDay.subtract 'days', currentDay.day()
    days = []
    for row in [0..rows]
      days[row] =
        'days': []
      for col in [0..6]
        days[row].days[col] =
          'day': moment(currentDay).date(),
          'id': "#{row}-#{col}"
          'class': if currentMonth is currentDay.month() then 'enabled' else 'disabled'
        currentDay.add 'days', 1
    days
  ).property('holidays.isLoaded')

  increaseMonth: ->
    @set('currentDate', moment(@get 'currentDate').add('months', 1))

  decreaseMonth: ->
    @set('currentDate', moment(@get 'currentDate').subtract('months', 1))
