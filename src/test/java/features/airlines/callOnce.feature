@run
Feature: Call once keyword 

# curl --request POST   --url https://api.sirv.com/v2/token   --header 'authorization: Bearer BEARER_TOKEN_HERE'   --header 'content-type: application/json'   --data '{"clientId":"UEWPOerUoHMPVyJycpiwU6aEiUd","clientSecret":"FpSitCpxs5F6hCUh7inoKsW8oKllvKVB36YVyjiuQ8dPk9JoA1MJk3UfhbSt9Ctwm57h9tY2wE7tGEW0xThurw=="}'

Background:
#approach1 - to use callonce
#* def accesstoken = callonce read('callFeature1.feature')
#approach2 - to use callonce 
* def accesstoken = karate.callSingle('callFeature1.feature')
#to configure this callonce to all the feature files it can be configured in karate config js file - added and commented the line karate config js file


Scenario: Generate access token -1
* print accesstoken.result.output.token




Scenario: Generate access token -2
* print accesstoken.result.output.token