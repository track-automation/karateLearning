Feature: Explore Mobile Automation of Web applications in Karate

Background:
* configure driver = {type:'android', start:true}
* def driverCapabilities = 
"""
{
  platformName: 'Android' ,
  platformVersion: '10',
  udid:'RZ8M844EF1X',
  browserName:'chrome'
}
"""

Scenario: Launch Chrome Browser in Android device
Given driver driverCapabilities
And driver 'https://www.google.com'
Then driver.close()