Holidays.Router.reopen
  location: "history"

Holidays.Router.map ->
  @resource 'calendar', ->
    @resource 'holiday'
