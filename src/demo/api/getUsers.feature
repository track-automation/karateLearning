Feature: Get User Details

Background:
* url 'https://reqres.in/api/users'

Scenario: Get a new user details
*  callonce read('classpath:src/demo/api/weathers.feature@createUser')
* print userId
Given path userId
When method GET
Then status 200