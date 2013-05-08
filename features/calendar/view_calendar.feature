Feature: View Calendar
  In order to view holidays
  As a guest user
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
    And I should see the "2013" year

  @javascript
  Scenario: User goes to the previous month
    Given I'm on the home page
    And today is "2013-02-01"
    When I click on the "#decrease" button
    Then I should see the "Jan" month
    And I should see the "2013" year

  @javascript
  Scenario: User goes to the next year
    Given I'm on the home page
    And today is "2013-12-31"
    When I click on the "#increase" button
    Then I should see the "Jan" month
    And I should see the "2014" year

  @javascript
  Scenario: User goes to the previous year
    Given I'm on the home page
    And today is "2013-01-01"
    When I click on the "#decrease" button
    Then I should see the "Dez" month
    And I should see the "2012" year

  @javascript
  Scenario: User goes to a month with holidays
    Given the following holiday exists:
      | name    |
      | labor   |
      | mothers |
    And I'm on the home page
    And today is "2013-05-01"
    Then I should see the following days highlighted:
      | date |
      | 5-1  |
      | 5-12 |
