Feature: Get User

Background:
* url "https://api.spacex.land/graphql/"
* def query = read('classpath:src/graphql/get/getUser.graphql')

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


