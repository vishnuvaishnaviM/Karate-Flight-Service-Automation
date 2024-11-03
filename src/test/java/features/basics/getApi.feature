@run
Feature: Get the passenger details

Scenario: Get passenger details
    Given url airlineUrl + 'v1/passenger'
    And param page = 0
    And param size = 10
    When method GET
    Then status 200 
    * def passengers = response.data
    * print "Retrieved Passenger Details:", passengers
    And print responseStatus
    And print responseTime
    * match each passengers contains { _id: '#present', name: '#string', trips: '#number', airline: '#[1]' }
    


Scenario: Get user details - invalid user
    Given url airlineUrl+'passenger/'
    And path '6942219000'
    When method Get
    Then status 404
    And print response 

Scenario: Get API with query parameters
    * def query = { page: 0, size: 10 }
    Given url airlineUrl + 'v1/passenger'
    And params query
    When method Get
    Then status 200
    And print response

Scenario: Get API with query parameters to print the count of the total records
    Given url airlineUrl + 'v1/passenger'
    And param page = 0
    And param size = 10
    When method Get
    Then status 200
    * def usercount = response.data.length
    * print 'total number of passengers in the given page ', usercount
