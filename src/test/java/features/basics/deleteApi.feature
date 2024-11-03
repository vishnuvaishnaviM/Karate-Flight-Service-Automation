@run
Feature: create an delete an API 
  Background:
   * url baseUrl
   * def random_string = 
  """
    function(s){
    var text = "";
    var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    for(var i=0;i<s;i++){
        text+=pattern.charAt(Math.floor(Math.random()*pattern.length()));
    }
    return text;
    }
  """
  * def randomString = random_string(10)
   * def requestPayload = read('classpath:payload/basics/user1.json')
   * requestPayload.email = randomString + "@gmail.com"

  Scenario: Creating new user and deleting the user
  Given path '/public/v2/users'
  And request requestPayload
  And header Authorization = 'Bearer ' + tokenID
  When method post 
  Then status 201
  And match $.id == '#present'
  
  * def id = response.id 
  * print id 

  # Fix: Add user ID to the path for the delete request
  Given path '/public/v2/users/' + id
  And header Authorization = 'Bearer ' + tokenID 
  When method delete
  Then status 204
 
 #check if the record is deleted
 Given path '/public/v2/users/' + id
 And header Authorization = 'Bearer '+tokenID
 When method Get 
 Then status 404
 And match $.message == 'Resource not found'

