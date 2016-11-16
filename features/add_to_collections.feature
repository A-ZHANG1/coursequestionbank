Feature: User can add individual problems to a Collection
  As an instructor
  So that I can organize my collections of questions
  I want to add a problem to a collection

Background:
  Given I am signed in with uid "1234" and provider "github"
  And I have uploaded 'bloom_test.txt'
  And I am on the CourseQuestionBank home page

Scenario: Add two collections that can see
  When I am on the dashboard
  And I follow "New collection"
  And I fill in "name" with "test1"
  And I press "Create"
  And I am on the dashboard
  And I should see Collection 'test1' in the database

  When I follow "New collection"
  And I fill in "name" with "test2"
  And I press "Create"
  And I am on the dashboard
  And I should see Collection 'test2' in the database

  When I am on the CourseQuestionBank home page
  And I press "show"
  Then I should see "test1"
  Then I should see "test2"
