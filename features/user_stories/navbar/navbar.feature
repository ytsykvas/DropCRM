Feature: User can see navbar

  Scenario: Not logged user can see navbar and log in button
    When I visit main page
    Then I should see the text: main page
    And I should see the text: prices page
    And I should see the text: contacts page
    And I should see the text: log in
    And I should not see the text: log out

  Scenario: User is logged in as a supplier
    Given We have a logged in user. It is supplier
    Then I should see the text: main page
    And I should see the text: prices page
    And I should see the text: contacts page
    And I should not see the text: log in
    And I should see the text: log out

  Scenario: User is logged in as a buyer
    Given We have a logged in user. It is supplier
    Then I should see the text: main page
    And I should see the text: prices page
    And I should see the text: contacts page
    And I should not see the text: log in
    And I should see the text: log out
