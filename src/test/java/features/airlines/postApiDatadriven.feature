@run
Feature: Scenario outline example for airlines creation 

Background:
    * url airlineUrl
    

Scenario Outline: Creating new airlines using data-driven testing  - approach1
* def payload = 
    """
    {
        "id": <id>,
        "name": "<name>",
        "country": "<country>",
        "head_quarters": "<head_quarters>",
        "established": "<established>"
    }
    """
Given path 'v1/airlines'
And request payload
When method post
Then status 200
And print response
And print __row
And print __num

Examples:
    | id | name | country | head_quarters | established |
    | 1  | virat | India  | Delhi         | 1989        |
    | 2  | Dhoni | India  | Jharkand      | 1985        |



Scenario Outline: Creating new airlines using data-driven testing  - approach2(better appraoch to handle empty fields)
* def payload = 
    """
    {
        "id": ##(id),
        "name": "##(name)",
        "country": "##(country)",
        "head_quarters": "##(head_quarters)",
        "established": ##(established)
    }
    """
Given path 'v1/airlines'
And request payload
When method post
Then status 200
And print response
And print __row
And print __num
And match response.name == '#string'


Examples:
    | id | name | country | head_quarters | established |
    | 3  | Rohit | India  | Delhi         | 1987      |
    |   | David | Australia  |       | 1987       | 



Scenario Outline: Creating new airlines using data-driven testing  - approach3 - using json file 
* def payload = 
    """
    {
    "name": "##(name)",
    "country": "##(country)",
    "logo": "##(logo)",
    "slogan": "##(slogan)",
    "head_quaters": "##(head_quaters)",
    "website": "##(website)",
    "established": "##(established)"
}
    """
Given path 'v1/airlines'
And request payload
When method post
Then status 200
And print response
And print __row
And print __num
And match response.name == '#string'


Examples:
    | read('classpath:payload/airlines/airlinesList.json')|


Scenario Outline: Creating new airlines using data-driven testing  - approach3 - using csv file 
* def payload = 
    """
    {
    "name": "##(name)",
    "country": "##(country)",
    "logo": "##(logo)",
    "slogan": "##(slogan)",
    "head_quaters": "##(head_quaters)",
    "website": "##(website)",
    "established": "##(established)"
}
    """
Given path 'v1/airlines'
And request payload
When method post
Then status 200
And print response
And print __row
And print __num
And match response.name == '#string'
And match response.established == "#regex [0-9]{4}"


Examples:
    | read('classpath:payload/airlines/airlineList.csv')|