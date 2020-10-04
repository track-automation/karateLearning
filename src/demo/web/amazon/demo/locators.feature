Feature: Explore the option to find element(s) using all the locators

Scenario: Find an element using locate option
Given driver 'https://www.amazon.in/'
When driver.maximize()
Then def amazonLogo = locate("[class=nav-logo-link]").present
And match amazonLogo == true

Scenario: Find all elements using locateAll option
Given driver 'https://www.amazon.in/'
And driver.maximize()
When  def filter = function(x){ return x.text.contains('Mobiles') }
And def amazonLogo = locateAll("a.nav-a")
And def mobileLink = karate.filter(amazonLogo,filter)
Then mobileLink[0].click()
And match text("title") contains "Mobile Phones"
