Feature: Launch Amazon.In And Verify The Home Page Controls

Scenario: Launch Amzon.in
Given driver 'https://www.amazon.in/'
And driver.maximize()
And waitFor("[class=nav-logo-link]")
Then match exists("[class=nav-logo-lin1k]") == true

Scenario Outline: Click On Menu Bar links
Given driver 'https://www.amazon.in/'
And driver.maximize()
When locate("[class=nav-logo-link]").present
And waitFor(locator)
Then click(locator)
And match text("title") contains '<title>'

Examples:
|locator        |title       |
|{a}Mobiles     |Mobiles     |
|{^a}Sellers    |Bestsellers |
|{^a}Deals      |Deals       |
|{a}Computers   |Computers   |
|{^a}Releases   |Releases    |
|{a}Books       |Books       |
|{^a}Gift       |Gift        |

