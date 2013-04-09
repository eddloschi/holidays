Holidays.Router.reopen
  location: "history"

Holidays.Router.map (match)->
  @route 'calendar.index', path: '/'

# Holidays.IndexRoute = Ember.Route.extend
#   redirect: ->
#     @transitionTo

