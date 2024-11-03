@run
Feature: Json expressions 

Scenario: Json expressions (reference - jayway jsonpaths)
    * def json_payload = 
    """
    {
    "store": {
        "book": [
            {
                "category": "reference",
                "author": "Nigel Rees",
                "title": "Sayings of the Century",
                "price": 8.95
            },
            {
                "category": "fiction",
                "author": "Evelyn Waugh",
                "title": "Sword of Honour",
                "price": 12.99
            },
            {
                "category": "fiction",
                "author": "Herman Melville",
                "title": "Moby Dick",
                "isbn": "0-553-21311-3",
                "price": 8.99
            },
            {
                "category": "fiction",
                "author": "J. R. R. Tolkien",
                "title": "The Lord of the Rings",
                "isbn": "0-395-19395-8",
                "price": 22.99
            }
        ],
        "bicycle": {
            "color": "red",
            "price": 19.95
        }
    },
    "expensive": 10
}
    """
    * match json_payload.expensive == 10
    * def expensive_value = get json_payload.expensive
    * print "expensive value is ", expensive_value

    
    * def expensive_val1 = get json_payload $.expensive
    * print "expensive value is ", expensive_val1

    * def expensive_val2 = $json_payload.expensive
    * print "expensive value is ", expensive_val2

    * def expensive_val3 = karate.get('$json_payload.expensive')
    * print "expensive value is ", expensive_val3

    * def expensive_val4 = karate.jsonPath(json_payload, '$.expensive')
    * print "expensive value is ", expensive_val4

    * def booktitle0 = json_payload.store.book[0].title
    * print 'title of first book ', booktitle0

    # * print 'title of all books ', json_payload.store.book[*].title
    # the above print statement willnot work as it contains json path with wildcard characters 

    * print 'approach1 - title of all books ',karate.jsonPath(json_payload, '$.store.book[*].title')

    * print 'approach2 - title of all books ',karate.jsonPath(json_payload, '$..title')

    * print ' to get the title based on specific condition ', karate.jsonPath(json_payload, "$.store.book[?(@.author == 'Nigel Rees')].title") 

    * print ' to get the title based on specific conditions ', karate.jsonPath(json_payload, "$.store.book[?(@.author == 'Nigel Rees' || @.author=='Evelyn Waugh')].title") 

    * print 'first book details ', karate.jsonPath(json_payload, "$.store.book[0]")

    * print 'second last book details ', karate.jsonPath(json_payload, "$.store.book[-2]")

    * print 'first and second book details ', karate.jsonPath(json_payload, "$.store.book[0,1]")

    * print ' first three book details ', karate.jsonPath(json_payload, "$.store.book[0:3]")

    * print 'total number of parameters present in a book ', karate.jsonPath(json_payload, "$.store.book.length()") 

    * print 'total price of all book ', karate.jsonPath(json_payload, "$..price.sum()")

    * print 'max price of all book ', karate.jsonPath(json_payload, "$..price.max()")
    