Feature: Get Countries

Background:
* url "https://countries.trevorblades.com/"

Scenario: Get Details of Countries

Given text query =
"""
query countries{
  countries{
    name
    native
    capital
    languages{
      name
    }
  }
}
"""
And request {query:'#(query)'}
When method POST
Then status 200