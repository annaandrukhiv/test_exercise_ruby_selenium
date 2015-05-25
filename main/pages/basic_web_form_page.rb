require_relative '../web_page'

# Class for a given basic web form page.
class BasicWebFormPage < WebPage

  NAME = 'Hanna'
  COMMENTS = 'Development and testing can not go without each other'
  URL = 'https://docs.google.com/forms/d/181whJlBduFo5qtDbxkBDWHjNQML5RutvHWOCjEFWswY/viewform'

  def initialize(driver)
    @driver = driver
    navigate_to_page(URL)
  end

  def get_web_form_displayed
    get_page_element(:id, 'ss-form').displayed?
  end

  def  get_name_field
    get_page_element(:id, 'entry_1041466219')
  end

  def get_enjoy_dev_yes_checkbox
    get_page_element(:id, 'group_310473641_1')
  end

  def get_test_framework_selection
    get_page_element(:id,'entry_262759813')
  end

  def get_comments_field
    get_page_element(:id, 'entry_649813199')
  end

  def get_submit_button
    get_page_element(:id, 'ss-submit')
  end

  def enter_name
    get_name_field.send_keys(NAME)
  end

  def check_enjoy_development
    get_enjoy_dev_yes_checkbox.click
  end

  def select_testing_framework
    option = Selenium::WebDriver::Support::Select.new(get_test_framework_selection)
    option.select_by(:value, 'JUnit')
  end

  def enter_comments
    get_comments_field.send_keys(COMMENTS)
  end

  def submit
    get_submit_button.click
  end

  def get_name_field_missing_error_message_displayed
    get_page_element(:xpath, "//input[@id='entry_1041466219']/../div[@class='required-message']").displayed?
  end

  def clear_name
    get_name_field.clear
    get_name_field.send_keys(:return)
  end

end