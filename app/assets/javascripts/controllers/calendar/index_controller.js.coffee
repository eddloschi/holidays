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
    rows = null
    if currentDay.day() + moment(currentDay).endOf('month').date() <= 28
      rows = 3
    else if currentDay.day() + moment(currentDay).endOf('month').date() <= 35
      rows = 4
    else
      rows = 5
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
    ).property('currentDate'),
  increaseMonth: ->
    @set('currentDate', moment(@get 'currentDate').add('months', 1))
