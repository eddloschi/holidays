Holidays.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo 'calendar'
