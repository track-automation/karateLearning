Feature: Add New User in Spacex Land

Background:
* url "https://api.spacex.land/graphql/"
* def mutation = read('classpath:src/graphql/create/addUser.graphql')

Scenario:Add New Users With Valid Input
* def variables =
"""
{
  objects: [
    {
      id: '11cd2db5-3e6e-4363-b8e5-afd2a67a5333',
      name: 'Neil Armstrong',
      rocket: 'PSLV',
      twitter: '@trulyIndian'
      
    }
  ]
}
"""
Given request {query:'#(mutation)', variables:'#(variables)'}
When method POST
Then status 200
* match $.data.insert_users == null

#* match response.errors[0].message contains "Uniqueness violation. duplicate key value violates unique constraint"