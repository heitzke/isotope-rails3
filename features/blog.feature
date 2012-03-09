Feature: Blog
  In order to see information about isotope|eleven
  As a visitor
  I want to view the blog

  Scenario: Viewing blog
    When I am on the blog
    Then I should see a basic page

  Scenario: Viewing blog feed
    Given there is a blog post
    When I am on the blog feed
    Then I should see a basic page

  Scenario: Viewing a tagged blog post
    Given there is a tagged blog post
    Then I should the blog post

