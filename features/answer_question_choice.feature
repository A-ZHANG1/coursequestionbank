Feature: Students answer questions
  As a student,
  So I can learn and practice,
  I want to be able to answer the questions


Background:
  Given I am signed in with uid "1234" and provider "github"
  Then I should see "Admin"
  And I have uploaded 'bloom_test.txt'
  And I am on the CourseQuestionBank home page


#Scenario: I can answer a multiple_choice/select_multiple/true_false question
#  Given I am signed in with uid "12345" and provider "github"
#  And I am on the CourseQuestionBank home page
#  And I check "CRUD"
#  Then I press "Check Answer"
#  Then I should see "Correct"
#  And I check "HTTP"
#  Then I press "Check Answer"
#  Then I should see "Wrong"
