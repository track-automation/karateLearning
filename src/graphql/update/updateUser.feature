Feature: Update Existing User in Spacex Land

Background:
* url "https://api.spacex.land/graphql/"
* def mutation = read('classpath:src/graphql/update/updateUser.graphql')


* def userDataHelper = call read('classpath:src/testdata/dataHelpers/userHelper.js')
* def randomHelper = call read('classpath:src/testdata/utils/randomhelper.js')

@updatedUserDetails
Scenario: Extract existing user details using js function and update user deatils
* def userDetails = userDataHelper.extractUser()
* def existingUserId = userDetails.id

* def newUserName = randomHelper.generateRandomString(10)

* def updatedUserDetails =
"""
{
    id:'#(existingUserId)',
    name:'#()'
}
"""

* def variables =
"""
{
  set: {
    name:  '#(newUserName)'
  },
  where: {
    id: {
      _eq: '#(existingUserId)'
    }
  }
  
}
"""
Given request {query:'#(mutation)', variables:'#(variables)'}
When method POST
Then status 200
And match $.data.update_users.returning[0] contains updatedUserDetails
