Feature: View Calendar
  In order to view holidays
  As a user
  I wanto to view a month's calendar

  @javascript
  Scenario: View present month's calendar
    Given I'm on the home page
    Then I should see a "div#calendar-id" element
    And I should see the "present" month
    And I should see the "present" year
    And I should see matching weekdays
    And I should see the correct rows amount

  @javascript
  Scenario: User goes to the next month
    Given I'm on the home page
    And today is "2013-01-01"
    When I click on the "#increase" button
    Then I should see the "Fev" month

  @javascript
  Scenario: User goes to the previous month
    Given I'm on the home page
    And today is "2013-02-01"
    When I click on the "#decrease" button
    Then I should see the "Jan" month
