Feature: Add New User in Spacex Land

Background:
* url "https://api.spacex.land/graphql/"
* def mutation = read('classpath:src/graphql/create/addUser.graphql')

#Helpers
* def randomHelper = call read('classpath:src/testdata/utils/randomhelper.js')

@createNewUser
Scenario:Add New Users With Valid Input
* def guid = randomHelper.generateRandomGUID()
* def userName = randomHelper.generateRandomString(10)
* def rocketName = randomHelper.generateRandomString(10)

* def variables =
"""
{
  objects: [
    {
      id: '#(guid)',
      name: '#(userName)',
      rocket: '#(rocketName)',
      twitter: '@trulyIndian'
      
    }
  ]
}
"""
Given request {query:'#(mutation)', variables:'#(variables)'}
When method POST
Then status 200
And match $.data.insert_users.returning[0].id == guid
* def user = response.data.insert_users.returning