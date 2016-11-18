Feature: Admin / instructors can share a collection
  As an Admin/ instructor
  I want to share a collection with others
  So the collection that being shared should be on "My collection" and "Public Collection"
  and this collection should not appear on others' "My collection", but should not be in others' "My collection"
  
  
  Background:
    Given I am signed in with uid "1234" and provider "github"
    And I am on the dashboard
    
  Scenario: The shared collection should appear on admin's "My collection" and "Public collection"
    When I am on the admin panel




  Scenario: The shared collection should not appear on other instructors' "My collection" 
    
    
  Scenario: The shared collection should appear on other instructors' "Public collection"
