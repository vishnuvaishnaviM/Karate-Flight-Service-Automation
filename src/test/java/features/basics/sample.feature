@run
Feature: Sample Feature file

Scenario: Hello world scenario
  * print 'hello world'

Scenario: storing variables scenario
  * def a = 100
  * def b = 30
  * print 'sum result ', a + b

Scenario: Handling jsonobject
  * def jsonobject = 
  """
  [
    {
      "name": "virat kohli",
      "sport": "cricket",
      "age": 35
    },
    {
      "name": "Dhoni",
      "sport": "cricket",
      "age": 40
    }
  ]
  """
  # prints complete jsonobject
  * print jsonobject  
  # prints the first json object in the array
  * print jsonobject[0]
  # access and print specific variables in the json array
  * print jsonobject[1].name + " " + jsonobject[1].sport + " " + jsonobject[1].age

Scenario: complex jsonobject scenario
  * def jsonobject1 = 
  """
  {
    "menu": {
      "id": "file",
      "value": "File",
      "popup": {
        "menuitem": [
          {"value": "New", "onclick": "CreateNewDoc()"},
          {"value": "Open", "onclick": "OpenDoc()"},
          {"value": "Close", "onclick": "CloseDoc()"}
        ]
      }
    }
  }
  """
  * print jsonobject1
  * print jsonobject1.menu.id
  * print jsonobject1.menu.popup.menuitem
  * print jsonobject1.menu.popup.menuitem[0].value
  * print jsonobject1.menu.popup.menuitem[0].onclick
