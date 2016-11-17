Feature: User can search for a collection
  As an instructor/admin
  So that I can locate an collection quickly
  I want to be able to search a collection by name or owner name

Background:
  Given I am signed in with uid "1234" and provider "github"
  And I have uploaded 'bloom_test.txt'
  Then I am signed in with uid "1234" and provider "github"
  When I am on the dashboard


Scenario: I search a solution that does not exist
  When I fill in "Search" with "cs169"
  And I press "Search"
  Then I should not see "cs169"
  Then I should not see "A few example questions"
  Then I should see "No collection matches"

Scenario: I search by collection name that User uploaded
  When I fill in "Search" with "A few example questions"
  And I press "Search"
  Then I should see "A few example questions"
  Then I should not see "cs169"
  Then I should not see "No collection matches"


Scenario: I search by collection with empty string
  When I fill in "Search" with ""
  Then I should see "A few example questions"
  Then I should not see "cs169"
  Then I should not see "No collection matches"
