@run
Feature: Post Apis 

Background:
    * url airlineUrl

Scenario: Create airline with correct airline details
* def new_airline = 
"""
{
    "name": "Sri Lankan Airways",
    "country": "Sri Lanka",
    "logo": "https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Qatar_Airways_Logo.svg/sri_lanka.png",
    "slogan": "From Sri Lanka",
    "head_quaters": "Katunayake, Sri Lanka",
    "website": "www.srilankaaairways.com",
    "established": "1990"
}
"""
* new_airline.country = 'India'

Given path 'v1/airlines'
And request new_airline
When method post 
Then status 200
And print response

Scenario: Read data from json file and create a new Airline 
* def new_airline = read('classpath:payload/airlines/newAirline.json')
# to create a new field or update a field in the json 
And set new_airline.country = 'India'
# to remove specific data from the json request 
And remove new_airline.established
Given path 'v1/airlines'
And request new_airline
When method post 
Then status 200
And print response

Scenario: Creating a new Airline data using nested complex nested json data using set multiple in karate 
* set airline_payload 
 | path  | value |
 |id    |12     |
 |name  | "Aman's Airline"  |
 | address[0].primary.street   | '76 A' |
 | address[0].primary.city   | 'New york' |
 | address[1].secondary.street   | '456 A' |
 | address[1].secondary.city   | 'Buffalo' |
* print airline_payload

* set airline_payload2
 | path  | 1 | 2 |
 |id    |12     | (null)    |
 |name  |'south east airline'   |'western airline'  |
* print airline_payload2
 
 Scenario: Generate fake data from datagenerator.java and create new airline
    
    * def datafaker = Java.type("resources.utils.DataGenerator")
    * def random_id = datafaker.getRandomInteger(5)
    * def random_fullname = datafaker.getFullName()
    * set new_airline_payload 
     | path  | value |
     |id    |random_id    |
     |name  | random_fullname  |

Scenario: Creating json payload by embedded expressions
    * def first_name = "virat"
    * def last_name = "kohli"
    * def sport = "cricket"
    * def comments = null
    #all the above variables can also be stored in karate config file and can be directly used in below json.
    * def sport1 = {"fname": '#(first_name)', "lname": '#(last_name)', "sport":'#(sport)', "fullname": '#(first_name + " " + last_name)', "comments": ##(null)}
    * print sport1

Scenario: Creating json payload by embedded expressions using data file from resources
    * def first_name = "virat"
    * def last_name = "kohli"
    * def sport = "cricket"
    * def sports_person = read('classpath:payload/airlines/newuser.json')
    * print sports_person
    * print `The sports person ${first_name}  ${last_name} plays ${sport}`