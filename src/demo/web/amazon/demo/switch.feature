Feature: This file is to explore switch option

Scenario: Switch Page using driver
Given driver 'https://www.amazon.in/'
And driver.maximize()
And click('#icp-nav-flyout')
When switchPage('gp/customer-preferences')
Then match text("title") contains "Change Language Settings"