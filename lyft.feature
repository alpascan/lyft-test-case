Feature: Rent a car for lyft
  As a user, I want to rent a car from lyft
  So that I can use the car in the alocated timetable


  Scenario: Happy path for renting as a logged in user
    Given I am logged into the lyft portal
    And I am on the rent a car page
    When I press rent a car, 
    And I am presented with a list of cars in my vicinity
    And I select a random car
    And I confirm the car
    Then I am presented with a confirmation screen that I have rented the car
    And the date is tomorrow
    And the location is near my location
    And I can see it on my reservations

  Scenario: Happy path for renting as a new user
    Given I am on the rent a car page
    When I press rent a car 
    And I am presented with a list of cars in my vicinity
    And I select a random car
    And I log in 
    And I confirm the car
    Then I am presented with a confirmation screen that I have rented the car
    And the date is tomorrow
    And the location is near my location
    And I can see it on my reservations

  Scenario: Happy path for renting as a new user
    Given I am on the rent a car page
    When I Search for a location that is not my location
    And I press rent a car
    Then I am presented with a list of cars in my search location

  Scenario: Negative path for browser location permission
    Given I am on the rent a car page
    And the browser doesn't have location permission
    When I press rent a car 
    And I decline the browser location screen
    Then I get an error related to location fetching

  Scenario: Negative path for wrong search location
    Given I am on the rent a car page
    When I search for a location that doesn't exist
    And I press rent a car
    Then I am presented with the option of allowing browser location

  Scenario: Edge case limitations for search date
    Given I am on the rent a car page
    When I select the date rental dates
    Then I am not allowed to pick dates in the past
    And I am not allowed to select more than 23 days
    And I am not allowed to have pickup hour greater than return hour
    And I am not allowed to rent more than 90 days in the future

  Scenario: Explore rental locations
    Given I am on the rent a car page
    When I select one of the options 
    Then I am presented with a list of cars in my search location
    
  Scenario: Cancelation of process
    Given I am on the rent a car page
    When I press rent a car
    And I select a random car
    And I log in 
    And I cancel the rent
    Then I am on the rent a car page

  Scenario: Error displayed 
    Given I am on the rent a car page
    When I press rent a car
    And something is wrong with the backend
    Then I am presented with an error message
    And I am provided guidance for the process
