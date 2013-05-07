Feature: View Holiday
  In order to view a specific month holidays
  As a guest user
  I wanto to select a month in a calendar

  @javascript
  Scenario: View month with fixed holidays
    Given the following holiday exists:
      | name      |
      | christmas |
    And I'm on the home page
    And today is "2013-12-01"
    Then I should see the following list:
      | name              | date                                 |
      | Christmas         | Quarta-feira, 25 de Dezembro de 2013 |

  @javascript
  Scenario: View month with a recurrent rule holidays
    Given the following holiday exists:
      | name              |
      | mothers           |
      | labor             |
      | corpus_christ     |
    And I'm on the home page
    And today is "2013-05-01"
    Then I should see the following list:
      | name              | date                                 |
      | Mother's Day      | Domingo, 12 de Maio de 2013          |
      | Labor Day         | Quarta-feira, 1 de Maio de 2013      |
      | Corpus Christ     | Quinta-feira, 30 de Maio de 2013     |

  @javascript
  Scenario: View month with an arbitrary holiday

  @javascript
  Scenario: View month with other holiday dependent holiday

  @javascript
  Scenario: View month without a holiday
    Given I'm on the home page
    And today is "2013-06-01"
    Then I should see the following text: "No holidays to display yet."
