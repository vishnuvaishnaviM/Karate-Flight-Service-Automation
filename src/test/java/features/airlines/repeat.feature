@run
Feature: Repeat feature 

Scenario: Running same js multiple times 
* def jsutil = read('classpath:utils/jsutils.js')
* def random_name = function() { return jsutil().printName(); }
* def data = karate.repeat(5, random_name)
* print data

# karate donot support running the same java method multiple times directly bu using karate.repeat 

Scenario: Calling java code inside javascript to repeat the same logic multiple times
* def javautil = Java.type('resources.utils.DataGenerator')
* def datagenerator = function() {return javautil.getFullName()}
* def data = karate.repeat(5, datagenerator)
* print data 

Scenario: Calling feature file inside js to repeat same logic multiple times 
* def callFeature = function(){ return karate.call('callFeature1.feature')}
* def data = karate.repeat(5, callFeature)
* print data
