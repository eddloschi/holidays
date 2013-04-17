# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html

Holiday.create(name: 'Valentines Day', schedule: {month_of_year: 2, day_of_month: 14}, recurrent: false)

schedule = IceCube::Schedule.new() do |s|
  s.add_recurrence_rule(IceCube::Rule.yearly.day_of_week(:sunday => [2]).month_of_year(:may))
end

Holiday.create(name: 'Mom`s Day', schedule: schedule.to_hash, recurrent: true)
