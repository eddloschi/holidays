# Holidays.Router.reopen
#   location: "history"

Holidays.Router.map ->
  @resource 'calendar', ->
    @resource 'holiday'

Holidays.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo 'calendar'

Holidays.CalendarRoute = Ember.Route.extend
  model: ->
    ym = @controllerFor('calendar').currentDate.format('YYYY-MM')
    Holidays.Holiday.find({arg: ym})

Holidays.CalendarIndexRoute = Ember.Route.extend
  model: ->
    @modelFor 'calendar'

# Holidays.CalendarIndexRoute = Ember.Route.extend
#   redirect: ->
#     @transitionTo 'holidays'

# Holidays.IndexRoute = Ember.Route.extend
#   redirect: ->
#     @transitionTo

