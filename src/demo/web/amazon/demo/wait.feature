Feature: Explore Wait options in karate.

@waitForUrl
Scenario:Wait For Url
Given driver 'https://www.amazon.in/'
And driver.maximize()
When click('{^a}Sellers')
Then waitForUrl('https://www.amazon.in/gp/bestsellers/')
And match text('title') contains 'Amazon.in Bestsellers: The most popular items on Amazon'

@waitForText
Scenario:Wait for Text to appear in the DOM
Given driver 'https://www.amazon.in/'
And driver.maximize()
And click('{^a}Mobiles').click()
When scroll('{h4}Brands')
And near('{span/span}Redmi').click()
Then waitForText('body','results for')
And match text('.a-color-state.a-text-bold') contains 'Redmi'


