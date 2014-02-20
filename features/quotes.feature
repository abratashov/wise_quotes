@javascript
@focus
Feature: Manage Quotes
  Scenario: Quotes List
    Given I have quotes contained love, life
    When I go to the list of quotes
    Then I should see "love"
      And I should see "life"

    # Then I should not see "love"
  Scenario: Create Valid Quote
    Given I have no quotes
    When I go to the list of quotes
      And I fill in "Text" with "peace"
      And I fill in "Tag" with "peace tag"
      And I press "Save"
    Then I should see "peace"
      And I should have 1 quote
