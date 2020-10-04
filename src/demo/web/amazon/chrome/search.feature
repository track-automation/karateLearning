Feature: Search For Products

Scenario: Search for Mobile Products Ater Selecting Mobile Category in drop down using menu bar link
Given driver 'https://www.amazon.in/'
And driver.maximize()
And waitFor("[class='nav-logo-link']") 
And waitUntil("document.readyState == 'complete'")
When click("{a}Mobiles")
And input('#twotabsearchtextbox','samsung')
And click("[type='submit']")
Then match text(".a-color-state.a-text-bold") == '"samsung"'


