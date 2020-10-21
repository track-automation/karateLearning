Feature: Explore Screenshot Options

Background:
* configure afterScenario =
"""
    function() {
        var info = karate.info;
        karate.log(info.errorMessage)
        if(info.errorMessage){
            driver.screenshot()
        }
    }
"""
Scenario:Take Screen shot of the current page
Given driver 'https://www.amazon.in/'
And driver.maximize()
Then waitFor('#abc')

Scenario:Take Screen shot of the current page
Given driver 'https://www.amazon.in/'
And driver.maximize()
When click('{^a}Mobiles').click()
Then match text('title') contains 'Mobiles'

Scenario:Take Screen shot of the current page
Given driver 'https://www.amazon.in/'
And driver.maximize()
Then screenshot('{^a}Mobiles')