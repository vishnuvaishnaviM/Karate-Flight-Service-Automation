@run
Feature: Handling Headers

Scenario: pass the user request with headers - part1

Given header Content-Type = 'text/xml;charset=ISO-8859-1'
And header Accept-Encoding = 'gzip,deflate'
And header Connection = 'Keep-Alive'
And header Expect = '100-continue'
And header User-Agent = 'Mozilla/4.0(compatible;IE;GACv7\. 1\. 5192\. 22378)'

When url baseUrl+'/public/v2/users/'
And path userId
When method Get
Then status 200

Scenario: pass the user request with headers - part2

* def request_headers = {Content-Type: 'text/xml;charset=ISO-8859-1', Accept-Encoding: 'gzip,deflate', Connection: 'Keep-Alive', Expect: '100-continue', User-Agent: 'Mozilla/4.0(compatible;IE;GACv7\. 1\. 5192\. 22378)'}
Given headers request_headers
When url baseUrl+'/public/v2/users/'
And path userId
When method Get
Then status 200

Scenario: pass the user request with headers - part3

* configure headers = {Content-Type: 'text/xml;charset=ISO-8859-1', Accept-Encoding: 'gzip,deflate', Connection: 'Keep-Alive', Expect: '100-continue', User-Agent: 'Mozilla/4.0(compatible;IE;GACv7\. 1\. 5192\. 22378)'}
When url baseUrl+'/public/v2/users/'
And path userId
When method Get
Then status 200

Scenario: Read auth bearer token from config js 

Given header Authorization = 'Bearer '+ tokenID
When url baseUrl+'/public/v2/users/'
And path userId
When method Get
Then status 200