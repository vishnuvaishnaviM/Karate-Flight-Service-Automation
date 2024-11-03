@run
Feature: Handling conditional logic 

Background:
    * url airlineUrl

Scenario: 1- By using ternary operator
    Given path 'v1/airlines/73dd5420-3bf9-48f3-a0b6-17cf7aa61b19'
    When method Get
    Then status 200
    * def result = responseStatus == 200 ? response : "test case failed"
    * print result

Scenario: 2- By using ternary operator- using logical operator
    Given path 'v1/airlines/73dd5420-3bf9-48f3-a0b6-17cf7aa61b19'
    When method Get
    Then status 200
    * def result = karate.jsonPath(response, "$[?(@.name == 'American Airlines')]").length > 0 ? response : "test case failed"
    * print result

Scenario: 3- By using nested ternary operator 
    Given path 'v1/airlines/73dd5420-3bf9-48f3-a0b6-17cf7aa61b19'
    When method Get
    Then status 200
    * def result1 = karate.jsonPath(response, "$[?(@.name == 'American Airlines1')]")
    * def result = responseStatus == 200 ? result1.length>0 ? result1 : "no match found" : "get method failed"
    * print result

Scenario: 4- By using if block
    Given path 'v1/airlines/73dd5420-3bf9-48f3-a0b6-17cf7aa61b19'
    When method Get
    Then status 200
    * def result = if (responseStatus == 200) response 
    * print result
    * def result = if(result == null) "get method failed"
    * print result 
