Feature: Services
  In order to see information about isotope|eleven
  As a visitor
  I want to view the services they offer

  Scenario: Viewing services page
    When I am on the services page
    Then I should see a basic page
    And  I should be able to view each service page successfully


  Scenario: Viewing community page
    When I am on a service page
    Then each service page should be linked
