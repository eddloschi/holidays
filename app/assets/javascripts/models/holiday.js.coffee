Holidays.Holiday = DS.Model.extend
  name: DS.attr('string'),
  nextOccurrence: DS.attr('date'),
  nextOccurrenceMoment: (->
    moment(@get('nextOccurrence')).utc().format('dddd, LL')
  ).property('nextOccurrence')
