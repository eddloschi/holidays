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
    Holidays.Holiday.find()

# Holidays.CalendarIndexRoute = Ember.Route.extend
#   redirect: ->
#     @transitionTo 'holidays'

# Holidays.IndexRoute = Ember.Route.extend
#   redirect: ->
#     @transitionTo

