@run
Feature: Configuring retry mechanism and usage of abort

Scenario: Configuring retry mechanism
  # Configuring retry mechanism at the feature level
  * configure retry = { count: 5, interval: 5000 }
  # Configuring to mark the skipped steps as pass for abort condition 
  # (if not marked as true in the report, it shows in orange color)
  * configure abortedStepsShouldPass = true

  Given url 'https://api.sirv.com/v21/files/upload'
  And param filename = '/image1.mvn'
  And header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRJZCI6IlVFV1BPZXJVb0hNUFZ5SnljcGl3VTZhRWlVZCIsImNsaWVudE5hbWUiOiJrYXJhdGUiLCJzY29wZSI6WyJhY2NvdW50OnJlYWQiLCJhY2NvdW50OndyaXRlIiwidXNlcjpyZWFkIiwidXNlcjp3cml0ZSIsImJpbGxpbmc6cmVhZCIsImJpbGxpbmc6d3JpdGUiLCJmaWxlczpyZWFkIiwiZmlsZXM6d3JpdGUiLCJmaWxlczpjcmVhdGUiLCJmaWxlczp1cGxvYWQ6bXVsdGlwYXJ0IiwiZmlsZXM6c2hhcmVkQmlsbGluZyIsInZpZGVvcyIsImltYWdlcyJdLCJpYXQiOjE3MzAyMDU3NTEsImV4cCI6MTczMDIwNjk1MSwiYXVkIjoiaHczOTN1YmxpcmlzajNra2J1MmhzYWJrcXlsenFlb3YifQ.vgo-OnrxucYY6ubcTh0BGbpc4op3xFhH9Cu7xgAHO1s'
  And request read('classpath:payload/airlines/image1.png')
  And header Content-Type = 'image/png'

  When method post
  # Retry until response status is 200
  And retry until responseStatus == 200
  * if (responseStatus != 200) karate.abort()
  Then status 200
  And print response

