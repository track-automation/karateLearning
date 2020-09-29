Feature: Create a New User in Req Res

Background:
* url "https://reqres.in/api"
* def testdata = read('classpath:src/testdata/csv/payload.csv')

@createAnUser
Scenario: Create a New User with valid inputs
Given def user = 
"""
{
    name: 'vinayagan',
    job: 'Senior Associate'
}
"""
And path 'users'
And request user
When method POST
Then status 201
* def expectedResult =
"""
{
    id:'#notnull',
    name: '#(user.name)',
    job: '#(user.job)'
}
"""
And match response contains expectedResult

@createMultiUser
Scenario Outline: Create Multiple Users using Examples
Given def user =
"""
{
    name: <userName>,
    job: <currentJob>
}
"""
And path 'users'
And request user
When method POST
Then status 201
* def expectedResult =
"""
{
    id:'#notnull',
    name: '#(user.name)',
    job: '#(user.job)'
}
"""
And match response contains expectedResult

Examples:
|userName     |currentJob         |
|Steven Rogers|Captain America    |
|Peter Parker |Spider Man         |

@createMultiUser
Scenario Outline: Create Multiple Users using csv
Given def user =
"""
{
    name: '<userName>',
    job: '<currentJob>'
}
"""
And def expectedResult =
"""
{
    name:'#string',
    job:'#string',
    id:'#string',
    createdAt:'#string'
}
"""
And path 'users'
And request user
When method POST
Then status 201
And match response == expectedResult

Examples:
|testdata|