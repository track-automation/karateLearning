Feature: Get Weather Details For Given Location

Background:
* url 'https://www.metaweather.com/api/location/'


Scenario: Get Weather details for London
* def woeid = 2487956

* def parentSchema = 
"""
{
    title:'#string',
    location_type:'#string',
    woeid:'#number',
    latt_long:'#string'
}
"""
* def sourcesSchema =
"""
{
    title:'#string',
    slug:'#string',
    url:'#string',
    crawl_rate:'#number'
}
"""

* def modelSchema =
"""
{
    time: '#string',
    sun_rise:'#string',
    sun_set:'#string',
    timezone_name:'#string',
    title:'#string',
    location_type:'#string',
    woeid:'#(woeid)',
    latt_long:'#string',
    timezone:'#string',
    parent:'#(parentSchema)'
}
"""

Given path woeid
When method get
Then status 200
And match response contains modelSchema
And match each response.sources[*] contains sourcesSchema

Scenario: Cannot Get Details For A Location By it's Name
Given path 'London'
When method get
Then status 404

Scenario: Cannot Get Details For A Location By Invalid WOE ID
Given path '444'
When method get
Then status 404

Scenario: Cannot Get Details For A Location By Passing Null in WOE ID
Given path null
When method get
Then status 404

Scenario: Requesting using query string
Given url 'https://reqres.in/api/users'
And param page = 2 
When method GET
Then status 200

@createUser
Scenario: Create A New User in the database
Given url 'https://reqres.in/api/'
And def userDetails =
"""
{
    name:'demo user',
    job: 'senior associate'
}
"""
And path 'users'
And request userDetails
When method POST
Then status 201
And match response.id == '#notnull'
* def userId = response.id