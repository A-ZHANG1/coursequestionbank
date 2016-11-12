#Feature: User should be able to see image in problem's view
#  As an User
#  I can see the image if problem contains the image
#
#  Scenario: Admin should see image in problem's view
#    Given I am signed in with uid "1234" and provider "github"
#    And I have uploaded 'test_question_with_image1.txt'
#    And I am on the CourseQuestionBank home page
#    And I should see image "image1"
#
#  Scenario: Instructor should see image in problem's view
#    Given I am signed in with uid "12345" and provider "github"
#    And I have uploaded 'test_question_with_image2.txt'
#    And I am on the CourseQuestionBank home page
#    And I should see image "image2"
#
#  Scenario: Student should see image in problem's view
#    Given I am signed in with uid "123456" and provider "github"
#    And I have uploaded 'test_question_with_image3.txt'
#    And I am on the CourseQuestionBank home page
#    And I should see image "image3"