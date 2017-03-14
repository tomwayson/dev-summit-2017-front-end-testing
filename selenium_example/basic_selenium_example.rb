# run like this: PATH=.:$PATH ruby basic_selenium_example.rb
require 'selenium-webdriver'

# chrome: Download chromedriver for your platform 
# from https://sites.google.com/a/chromium.org/chromedriver/ 
# and put it in this directory.
#Selenium::WebDriver::Chrome::Service.executable_path = File.join(Dir.pwd, 'chromedriver')
#driver = Selenium::WebDriver.for :chrome

# firefox: download geckodriver for your platform
# from https://github.com/mozilla/geckodriver/releases
# and put it in this directory.
driver = Selenium::WebDriver.for :firefox, marionette: true

driver.navigate.to "http://google.com"
element = driver.find_element({name: 'q'})
element.send_keys "Selenium Tutorials"
element.send_keys :enter
sleep 2 # not recommended to use sleep; we should use an implicit wait

if /toolsqa.com/.match(driver.page_source)
  puts "pass"
else
  puts "fail"
end

driver.quit
