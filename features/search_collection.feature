#Feature: User can search for a collection
#  As an instructor/admin
#  So that I can locate an collection quickly
#  I want to be able to search a collection by name or owner name
#
#Background:
#  Given I am signed in with uid "1234" and provider "github"
#  And I have uploaded 'bloom_test.txt'
#  And I am on the CourseQuestionBank home page
#  And I follow "Public Collection"
#Scenario: I search a solution that does not exist
#  When I fill in "search_collection" with "Foo"
#  Then I should see "Your search Foo did not match any result"
#Scenario: I search by collection name
#  When I fill in "search_collection" with "A few example question"
#  Then I should see "A few example question" under "collection"
#Scenario: I search by collection owner name
#  When I fill in "search_collection" with "admin"
#  Then I should see "A few example question" under "collection"
