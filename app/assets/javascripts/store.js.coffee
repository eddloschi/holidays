Holidays.Store = DS.Store.extend
  revision: 12
  adapter: DS.RESTAdapter.create
    findQuery: (store, type, query, recordArray) ->
      root = @rootForType type
      @ajax @buildURL(root, query.arg), "GET",
        success: (json) ->
          Ember.run @, ->
            @didFindQuery store, type, json, recordArray
