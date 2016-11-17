Feature:
  As an instructor/Admin, I want to do minor edit on a question
Background:
  Given I am signed in with uid "1234" and provider "github"
  Then I should see "Admin"
  And I have uploaded 'bloom_test.txt'
  And I am on the CourseQuestionBank home page
Scenario: I edit the question slighly
  And I press "Update"
  And I enter "Some question text" in question text
  And I press "Confirm Update"
  Then I should see "You only want to update question when making minor edits. "
  And I click "Yes. Proceed"
  And I should see "Some question text"
Scenario: I edit the question, then I regreted that I was editing too much on this question
  And I press "Update"
  And I enter "Some question text" in question text
  And I press "Confirm Update"
  Then I should see "You only want to update question when making minor edits. "
  And I click "No Go Back!"
  And I should not see "Some question text"
