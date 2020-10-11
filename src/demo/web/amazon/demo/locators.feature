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

@elementTextEquals @wildCardLocators
Scenario: Click a link using exact content
Given driver 'https://www.amazon.in/'
And driver.maximize()
And click('{a}Mobiles')
Then match text("title") contains "Mobile Phones"

@elementTextContains @wildCardLocators
Scenario: Click a link using partial content
Given driver 'https://www.amazon.in/'
And driver.maximize()
And click('{^a}Deals')
Then match text("title") contains "Today's Deals"

#This is not working.
Scenario: Click the first element contains Mobiles of any tag 
Given driver 'https://www.amazon.in/'
And driver.maximize()
And locateAll('{^}Mobiles')[0].click()
* print text("title")

@elementBelowAParent @wildCardLocators
Scenario:click the first element contains exact word of an immediate parent
Given driver 'https://www.amazon.in/'
And driver.maximize()
And click('{div/a}See more')
* print text('title')

@elementAtParticualPosition @wildCardLocators
Scenario:click the element based of position contains a text
Given driver 'https://www.amazon.in/'
And driver.maximize()
And def link = locate('{^*:4}See')
And link.click()
* print text("title")

@leftOf @friendlyLocators
Scenario:click an element positioned left of an element
Given driver 'https://www.amazon.in/'
And driver.maximize()
And delay(10000)
And leftOf('{^a}Today').find('{^a}Sellers').click()
* print text('title')

@rightOf @friendlyLocators
Scenario:click an element rigth left of an element
Given driver 'https://www.amazon.in/'
And driver.maximize()
And delay(10000)
And rightOf('{^a}Today').find('{^a}Computers').click()
* print text('title')

@above @friendlyLocators
Scenario:click an element placed above an element in DOM
Given driver 'https://www.amazon.in/'
And driver.maximize()
And delay(10000)
And rightOf('{^a}Today').find('{^a}Computers').click()
And waitForUrl('https://www.amazon.in/computers-and-accessories')
When above('{^span}TV').find('a').click()
Then match text("title") contains "Home Theater"

@below @friendlyLocators
Scenario:click an element placed below an element in DOM
Given driver 'https://www.amazon.in/'
And driver.maximize()
And delay(5000)
And rightOf('{^a}Today').find('{^a}Computers').click()
And waitForUrl('https://www.amazon.in/computers-and-accessories')
When scroll('#bottomBar')
And below('span.pagnLink').find('{a}2').click()
And delay(5000)

@near @friendlyLocators
Scenario:click an element placed near any direction of a given element in DOM
Given driver 'https://www.amazon.in/'
And driver.maximize()
And delay(5000)
And rightOf('{^a}Today').find('{^a}Computers').click()
And waitForUrl('https://www.amazon.in/computers-and-accessories')
When scroll('{h4}Brands')
And near('{span/span}MI').click()
And delay(5000)

@firstChild @treeWalking
Scenario: Click the first child element of a given parent
Given driver 'https://www.amazon.in/'
And driver.maximize()
And delay(5000)
When locate('a.nav-a').parent.firstChild.click()
And delay(10000)

@lastChild @treeWalking
Scenario: Click the last child element of a given parent
Given driver 'https://www.amazon.in/'
And driver.maximize()
And delay(5000)
When locate('a.nav-a').parent.lastChild.click()
And delay(10000)

@children @treeWalking
Scenario: Click an element at the given positon
Given driver 'https://www.amazon.in/'
And driver.maximize()
And click('{a}Mobiles')
And waitForUrl('https://www.amazon.in/mobile-phones')
When locate('a.nav-hasArrow').parent.children[4].click()
And delay(10000)

@nextSibling @treeWalking
Scenario: Click an element which is a next sibling to an element
Given driver 'https://www.amazon.in/'
And driver.maximize()
When locate('{a}Computers').nextSibling.click()
And print text('title')

@previousSibling @treeWalking
Scenario: Click an element which is a previous sibling to an element
Given driver 'https://www.amazon.in/'
And driver.maximize()
And locate('{a}Computers').previousSibling.click()
And print text('title')