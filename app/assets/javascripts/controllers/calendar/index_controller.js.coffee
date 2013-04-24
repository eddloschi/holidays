Holidays.CalendarIndexController = Ember.ArrayController.extend
  needs: ['calendar']
  holidays: (->
    ym = @get('controllers.calendar.currentDate').format('YYYY-MM')
    Holidays.Holiday.find({arg: ym})
  ).property('controllers.calendar.currentDate')
