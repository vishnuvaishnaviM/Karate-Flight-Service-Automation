@run
Feature: Get Airline details of specific id

Background:
    * url airlineUrl



Scenario: To get all the airline details validate the results
Given path 'v1/airlines/73dd5420-3bf9-48f3-a0b6-17cf7aa61b19'
When method Get
Then status 200
And match response == '#notnull'
And print response[0]
And print responseHeaders["Content-Type"][0]
And match header Content-Type == "application/json; charset=utf-8"
And match karate.response.header('Content-Type') contains "application/json"


