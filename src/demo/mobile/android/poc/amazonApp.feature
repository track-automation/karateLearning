Feature: POC for Hybrid Mobile Application Automation in Karate

Background:
* configure driver = 
"""
{ 
    type: 'android', 
    webDriverPath : "/wd/hub", 
    start: true
}
"""
* def driverCaps = 
"""
{
  platformName: 'Android',
  platformVersion: '10',
  udid:'RZ8M844EF1X',
  connectHardwareKeyboard:true,
  deviceName:'SM-M307F',
  automationName:'UiAutomator1',
  appPackage:'in.amazon.mShop.android.shopping',
  appActivity:'com.amazon.mShop.android.home.HomeActivity',
  unicodeKeyboard:true,
  resetKeyboard:true,
  httpConfig : { readTimeout: 120000 }
}
"""

Scenario: Search For An Item in Amazon Mobile App
Given driver { webDriverSession: { desiredCapabilities : "#(driverCaps)"} }
And driver.click("//android.widget.ImageView[contains(@content-desc,'English')]")
And driver.click('#in.amazon.mShop.android.shopping:id/skip_sign_in_button')
And driver.input('#in.amazon.mShop.android.shopping:id/rs_search_src_text',"test")
And driver.presskey(66)
Then match driver.text('#in.amazon.mShop.android.shopping:id/rs_search_src_text') == 'test'