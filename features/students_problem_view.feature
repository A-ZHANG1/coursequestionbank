Feature: Student's view of problem table, aka /problems, /homepage
  As a Student, I should not see the edit panel for each question, just the plain text of the question


  Background:
    Given I am signed in with uid "1234" and provider "github"
    And I have uploaded 'bloom_test.txt'
    Then I am signed in with uid "12345" and provider "developer"

  Scenario: I should be identified as student:
    When I am on the CourseQuestionBank home page
    Then I should see "Student!"

  Scenario: I can not see the edit panel catagory
    When I am on the CourseQuestionBank home page
    Then I should not see "Question Text"
    And I should not see "Which of the following best identifies the four basic operations supported by RDBMS?"
    And I should see "Student!"
    And I should not see "Previous version:"
    And I should not see "Your Collections:"
    And I should not see "Bloom Category:"
    And I should not see "Supersede:"

  Scenario: I can not add tag to questions
    When I am on the CourseQuestionBank home page
    Then I should not see "Tag checked problems"  


