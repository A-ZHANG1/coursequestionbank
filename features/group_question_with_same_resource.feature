Feature: User should be able to see group of questions with same resource
  As an User
  I can see one image if a group of questions contains same image

  Scenario: Admin should see image in problem's view if a group of questions contains same image
    Given I am signed in with uid "1234" and provider "github"
    And I have uploaded 'group_question_with_image1.txt'
    And I am on the CourseQuestionBank home page
    And I should see image "image1"
    And I should see "question1"
    And I should see "question1-1"
    And I should see "question1-2"

  Scenario: Instructor should see image in problem's view if a group of questions contains same image
    Given I am signed in with uid "12345" and provider "github"
    And I have uploaded 'group_question_with_image1.txt'
    And I am on the CourseQuestionBank home page
    And I should see image "image2-2"
    And I should see image "image2-3"

  Scenario: Student should see image in problem's view if a group of questions contains same image
    Given I am signed in with uid "123456" and provider "github"
    And I have uploaded 'group_question_with_image1.txt'
    And I am on the CourseQuestionBank home page
    And I should see image "image3-1"
    And I should see image "image3-2"