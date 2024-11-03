@run
Feature: creating and updating an user 
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

  Scenario: Creating new user and updating the user
  Given path '/public/v2/users'
  And request requestPayload
  And header Authorization = 'Bearer ' + tokenID
  When method post 
  Then status 201
  And match $.id == '#present'
  
  * def id = response.id 
  * print id 
  * def update_payload =
  """
  {
   "gender": "female",
   "status": "inactive"
  }
  """
  # Fix: Add user ID to the path for the PUT request
  Given path '/public/v2/users/' + id
  And request update_payload
  And header Authorization = 'Bearer ' + tokenID 
  When method put
  Then status 200
  And match $.gender == 'female'
  And match $.status == 'inactive'
