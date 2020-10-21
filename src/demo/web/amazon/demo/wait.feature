Feature: Explore Wait options in karate.

@waitForUrl
Scenario:Wait For Url
Given driver 'https://www.amazon.in/'
And driver.maximize()
When click('{^a}Sellers')
And waitForUrl('https://www.amazon.in/gp/bestsellers/')
Then click('{^a}Releases')
And match text('title') contains 'Hot New Releases'

@waitForText
Scenario:Wait for Text to appear in the DOM
Given driver 'https://www.amazon.in/'
And driver.maximize()
And click('{^a}Mobiles').click()
When scroll('{h4}Brands')
And near('{span/span}Redmi').click()
Then waitForText('body','results for')
And match text('.a-color-state.a-text-bold') contains 'Redmi'

@waitUntil
Scenario:Wait for Text to appear in the DOM
Given driver 'https://www.amazon.in/'
And driver.maximize()
And click('{^a}Mobiles').click()And click('{^a}Mobiles').click()
When scroll('{h4}Brands')
And near('{span/span}Redmi').click()
* waitUntil("document.readyState == 'complete'")
And scroll('.a-pagination')
Then below('li.a-normal').find('{a}2').click()


