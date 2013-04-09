Holidays.CalendarIndexController = Ember.ObjectController.extend
  currentDate: moment()
  currentMonthName: (->
      @get('currentDate').format('MMM')
    ).property('currentDate')
  currentYear: (->
      @get('currentDate').format('YYYY')
    ).property('currentDate')
  weekDays: moment()._lang._weekdays
  monthDays: (->
    currentDay = moment(@get('currentDate')).startOf 'month'
    currentMonth = currentDay.month()
    rows = if currentDay.day() + moment(currentDay).endOf('month').date() <= 35 then 4 else 5
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
    ).property('currentDate')
