require 'selenium-webdriver'

# Parent class for a BasicWebForm and BasicWebFormConfirmationPage class containing
# some common methods.
class WebPage

  MAX_WAITING_TIME = 10 #seconds

  def initialize(driver)
    @driver = driver
  end

  def wait_timeout
    @wait = Selenium::WebDriver::Wait.new(:timeout => MAX_WAITING_TIME)
  end

  def get_page_element(by, value)
    wait_timeout.until { @driver.find_element(by, value)  }
  end

  def navigate_to_page(url)
    @driver.navigate.to url
  end

end