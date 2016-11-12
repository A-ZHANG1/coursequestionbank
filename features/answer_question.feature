Feature: Students answer questions
  As a student,
  So I can learn and practice,
  I want to be able to answer the questions


Background:
  Given I am signed in with uid "1234" and provider "github"
  Then I should see "Admin"
  And I have uploaded 'test_answer.txt'
  And I am on the CourseQuestionBank home page
Scenario: I can answer a multiple choice/select multiple/true false question
  Given I am signed in with uid "12345" and provider "github"
  And I am on the CourseQuestionBank home page
  And I check "Answer"
  Then I press "check"
  Then I should see "Correct"
  And I check "Distractor"
  Then I press "check"
  Then I should see "Wrong"
Scenario: I can answer a fill-in-the-blank question
  Given I am signed in with uid "12345" and provider "github"
  And I am on the CourseQuestionBank home page
  And I fill in "answer_field" with "Ruby"
  And I press "check"
  And I should see "Correct"
  And I fill in "answer_field" with "Java"
  And I press "check"
  And I should see "Wrong"
