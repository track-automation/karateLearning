Feature: This feature is to explore the driver capabilities in karate

Background:


Scenario: Navigate to a url and maximize browser window using driver
Given driver 'https://www.amazon.in/'
And driver.maximize()

Scenario: Configure IE Driver And Navigate to a url
* configure driver = { type: 'iedriver', executable: 'IEDriverServer', start: true , port: 5555 }
Given driver 'https://www.amazon.in/'
And driver.reload()
And driver.maximize()

Scenario: Configure FireFox Driver And Navigate to a url
* configure driver = { type: 'geckodriver', executable: 'geckodriver', start: true , port: 4444 }
Given driver 'https://www.amazon.in/'
And driver.maximize()

Scenario: Close Browser Window
* configure driver = { type: 'geckodriver', executable: 'geckodriver', start: true , port: 4444 }
Given driver 'https://www.amazon.in/'
And driver.close()


Scenario: Close Quit Driver
* configure driver = { type: 'geckodriver', executable: 'geckodriver', start: true , port: 4444 }
Given driver 'https://www.amazon.in/'
And driver.quit()