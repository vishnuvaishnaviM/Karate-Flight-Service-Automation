@ignore
Feature: call Feature 

@sc1
Scenario: Dynamic payload that can be reused in other feature files

    Given url "https://api.sirv.com/v2/token"
    Then request 
        """
        {
            "clientId": "#(client_values.clientId)",
            "clientSecret": "#(client_values.clientSecret)"
        }
        """
    When method post
    Then status 200
    * def output = response 
    * def result = output 
