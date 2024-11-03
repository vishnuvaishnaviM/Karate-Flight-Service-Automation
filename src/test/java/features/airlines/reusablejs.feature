@run
Feature: Calling javascript in feature file 

Scenario: Return name from javascript code 
* def jsutil = read('classpath:utils/jsutils.js')
* def username = jsutil().printName();
* print 'username: ', username

* def username1 = jsutil().printName1("virat");
* print 'username1: ', username1

* def username2 = jsutil().printName2("kohli");
* print 'username2: ', username2
