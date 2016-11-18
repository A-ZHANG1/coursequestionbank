Feature: Students answer questions
  As a student,
  So I can learn and practice,
  I want to be able to answer the questions


Background:
  Given I am signed in with uid "1234" and provider "github"
  Then I should see "Admin"
  And I have uploaded 'test_fill_in.txt'
  And I am on the CourseQuestionBank home page

Scenario: I can answer a fill-in-the-blank question
  Given I am signed in with uid "12345" and provider "github"
  And I am on the CourseQuestionBank home page
  And I fill in "fill-in" with "/route/i"
  And I press "Check Answer"
  And I should see "Correct"
  And I fill in "fill-in" with "Java"
  And I press "Check Answer"
  And I should see "Wrong"
