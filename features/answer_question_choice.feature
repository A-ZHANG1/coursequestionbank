Feature: Students answer questions
  As a student,
  So I can learn and practice,
  I want to be able to answer the questions


Background:
  Given I am signed in with uid "1234" and provider "github"
  Then I should see "Admin"
  And I have uploaded 'select_multiple.txt'
  And I am on the CourseQuestionBank home page


Scenario: I can answer a multiple_choice/select_multiple/true_false question
  Given I am signed in with uid "12345" and provider "github"
  And I am on the CourseQuestionBank home page
  And I check "666-3"
  Then I press "Check Answer"
  And I should see a "Correct" message
