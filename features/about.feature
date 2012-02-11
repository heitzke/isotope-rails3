Feature: About Us
  In order to see information about isotope|eleven
  As a visitor
  I want to view employees and basic information

  Scenario: Viewing about index
    When I am on the about page
    Then I should see a basic page

  Scenario: Viewing information about a particular user
    When I am on the about page for a given user
    Then I should see a basic page
    And I should see some blog posts
