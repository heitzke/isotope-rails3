Feature: Community
  In order to see information about isotope|eleven
  As a visitor
  I want to view the community page

  Scenario: Viewing community page
    When I am on the community page
    Then I should see a basic page
    And  I should be able to view each community project page successfully


  Scenario: Viewing community page
    When I am on a community page
    Then each community page should be linked
