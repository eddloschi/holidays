Feature: View Calendar
  In order to view holidays
  As a user
  I wanto to view a month's calendar

  Scenario: View current month's calendar
    When I enter the page
    Then I should see a calendar element
    And I should see the current month
    And I should see the current year
