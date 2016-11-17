Feature: User can search for a collection
  As an instructor/admin
  So that I can locate an collection quickly
  I want to be able to search a collection by name or owner name

Background:
  Given I am signed in with uid "1234" and provider "github"
  And I have uploaded 'bloom_test.txt'
  And I have uploaded 'dup_test_first.txt'
  And I am on the CourseQuestionBank home page
  And I follow "Public Collection"

Scenario: I search a collection that does not exist
  When I fill in "Search" with "Foo"
  Then I should see "No collection matches."
  # Then I should see "You have no collections."
  
  
Scenario: I search a collection by its name
  When I fill in "Search" with "A few example questions"
  And I press "Search"
  Then I should not see "Near Duplicate Test"
  And I should see "A few example questions"
  
  
# Scenario: I search a collection by its owner's name
#   When I fill in "search_collection" with "admin"
#   Then I should see "A few example question" under "collection"
