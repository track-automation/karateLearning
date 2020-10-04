Feature: This feature is to explore scroll down options in karate

Scenario: Scroll to element and click
Given driver 'https://www.amazon.in/'
And driver.maximize()
And click('#icp-nav-flyout')
And scroll('#icp-btn-close-announce').click()
Then match text("title") contains "Amazon.in"