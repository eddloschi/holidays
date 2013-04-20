Feature: View Holiday
  In order to view a specific month holidays
  As a guest user
  I wanto to select a month in a calendar

  @javascript
  Scenario: View month with fixed holidays
    Given the following holiday exists:
      | name              | schedule                                | recurrent       |
      | Valentines Day    | {month_of_year: 2, day_of_month: 14 }   | false           |
    And I'm on the home page
    And today is "2013-02-01"
    Then I should see the following list:
      | name              | date                          |
      | Valentines Day    | Quinta-feira, 14 de fevereiro |

  @javascript
  Scenario: View month with a recurrent rule holidays
    Given I'm on the home page
    And today is "2013-05-01"
    Then I should see the following list:
      | name              | date                          |
      | Mom's Day         | Domingo, 11 de maio           |
      | Work Day          | Quarta-feira, 1 de maio       |
      | Corpus Christ     | Quinta-feira, 30 de maio      |

  @javascript
  Scenario: View month with an arbitrary holiday

  @javascript
  Scenario: View month with other holiday dependent holiday

  @javascript
  Scenario: View month without a holiday
    Given I'm on the home page
    And today is "2013-06-01"
    Then I should see the following text: "No holidays to display yet."
