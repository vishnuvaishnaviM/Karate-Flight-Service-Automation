Feature: Call feature 

Scenario: Using scenario from callFeature2 file 
    * def client_values = 
    """
    {
        "clientId": "UEWPOerUoHMPVyJycpiwU6aEiUd",
        "clientSecret": "FpSitCpxs5F6hCUh7inoKsW8oKllvKVB36YVyjiuQ8dPk9JoA1MJk3UfhbSt9Ctwm57h9tY2wE7tGEW0xThurw=="    
    }
    """
    * def returnData = call read('callFeature2.feature@sc1') client_values
    * def result = returnData 
