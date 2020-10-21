Feature: Get User

Background:
* url "https://api.spacex.land/graphql/"
* def query = read('classpath:src/graphql/get/getUser.graphql')

* def userDataHelper = call read('classpath:src/testdata/dataHelpers/userHelper.js')

@getUserByID
Scenario: Get User By Id
* callonce read('classpath:src/graphql/create/addUser.feature@createNewUser')
* def id = response.data.insert_users.returning[0].id
* def variables =
"""
{
    id:'#(id)'
}
"""
Given request {query:'#(query)', variables:'#(variables)'}
When method POST
Then status 200

Scenario: Extract User Id using js function and fetch user deatils
* def userDetails = userDataHelper.extractUser()
* def id = userDetails.id

* def expectedDetails =
"""
{
    id:'#(id)',
    name:'#(userDetails.name)',
    rocket:'#(userDetails.rocket)'
}
"""

* def variables =
"""
{
    id:'#(id)'
}
"""
Given request {query:'#(query)', variables:'#(variables)'}
When method POST
Then status 200
And match $.data.users_by_pk contains expectedDetails


