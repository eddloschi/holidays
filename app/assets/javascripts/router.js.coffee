# Holidays.Router.reopen
#   location: "history"

Holidays.Router.map ->
  @resource 'calendar', ->
    @resource 'holiday'

Holidays.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo 'calendar'
