Feature: Different users should see different navbar

  Scenario: Supplier should see toolbar fot suppliers
    Given We have a logged in user. It is supplier
    Then I should see the text: messages
    And I should see the text: staff
    And I should see the text: orders
    And I should see the text: buyers
    And I should see the text: statistic
    And I should see the text: payouts
    And I should see the text: advertisement
    And I should see the text: help
    And I should see the text: settings
    And I should not see the text: suppliers
    And I should not see the text: cart

  Scenario: Buyer should see toolbar fot buyers
    Given We have a logged in user. It is buyer
    Then I should see the text: messages
    And I should see the text: cart
    And I should see the text: orders
    And I should see the text: suppliers
    And I should see the text: statistic
    And I should see the text: wallet
    And I should see the text: payouts
    And I should see the text: help
    And I should see the text: settings
    And I should not see the text: buyers
    And I should not see the text: advertisement
