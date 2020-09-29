Feature: Get User list in Req Res

Background:
* url "https://reqres.in/api"

@getUsers
Scenario: Get All Users in Req Res
* def endPointPath = 'users'
Given path endPointPath
When method GET
Then status 200
And assert response != null

@getUsersInAPage
Scenario: Get Users in specific page using query string
Given path 'users'
And param page = 2
When method GET
Then status 200
And match response == '#notnull'
And match each response.data[*].id == '#number'

Scenario: Get a specific user using end point
Given path 'users/2'
When method GET
Then status 200
* def expectedResult =
"""
{
    id:'#notnull',
    email:'#string',
    first_name: '#string',
    last_name:'#string'
}
"""
And match response == '#notnull'
And match response.data.id == 2
And match response.data contains expectedResult