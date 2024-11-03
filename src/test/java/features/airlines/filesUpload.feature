@ignore
Feature: Files upload 

Scenario: Uploading binary files 
Given url 'https://api.sirv.com/v2/files/upload'
And param filename = '/image1.mvn'
And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRJZCI6IlVFV1BPZXJVb0hNUFZ5SnljcGl3VTZhRWlVZCIsImNsaWVudE5hbWUiOiJrYXJhdGUiLCJzY29wZSI6WyJhY2NvdW50OnJlYWQiLCJhY2NvdW50OndyaXRlIiwidXNlcjpyZWFkIiwidXNlcjp3cml0ZSIsImJpbGxpbmc6cmVhZCIsImJpbGxpbmc6d3JpdGUiLCJmaWxlczpyZWFkIiwiZmlsZXM6d3JpdGUiLCJmaWxlczpjcmVhdGUiLCJmaWxlczp1cGxvYWQ6bXVsdGlwYXJ0IiwiZmlsZXM6c2hhcmVkQmlsbGluZyIsInZpZGVvcyIsImltYWdlcyJdLCJpYXQiOjE3MzA1ODQ2NzUsImV4cCI6MTczMDU4NTg3NSwiYXVkIjoiaHczOTN1YmxpcmlzajNra2J1MmhzYWJrcXlsenFlb3YifQ.XLpE-PivAIJyFWPJLsrY4ooCZWHfRXaXDN2Vo21NJ-g'
And request read('classpath:payload/airlines/image1.png')
And header Content-Type = 'image/png'
When method post
Then status 200


# to get the auth barer for above binary file upload
# curl --request POST   --url https://api.sirv.com/v2/token   --header 'authorization: Bearer BEARER_TOKEN_HERE'   --header 'content-type: application/json'   --data '{"clientId":"UEWPOerUoHMPVyJycpiwU6aEiUd","clientSecret":"FpSitCpxs5F6hCUh7inoKsW8oKllvKVB36YVyjiuQ8dPk9JoA1MJk3UfhbSt9Ctwm57h9tY2wE7tGEW0xThurw=="}'



Scenario: Uploading multi part file 
Given url 'https://upload.uploadcare.com/base/'
And multipart file logoFile = {filename: 'classpath:payloads/airlines/image1.png'}
And multipart field UPLOADCARE_PUB_KEY = 'ed5032ba0754ac85e3f8'
When method post 
Then status 200