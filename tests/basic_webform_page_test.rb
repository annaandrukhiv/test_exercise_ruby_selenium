require_relative '../main/pages/basic_web_form_page'
require_relative '../main/pages/basic_web_form_confirmation_page'
require 'test/unit'
require 'selenium-webdriver'
require 'test/unit/assertions'

# Class that tests BasicWebFormPage class.
class BasicWebformPageTest < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @driver.manage.window.maximize
  end

  def teardown
   @driver.quit
  end

  # Positive/Happy-flow test case that verifies given web form is being successfully
  # submitted after filling in all question/information fields with proper values.
  def test_submit_form_happy_flow
    web_form_page = get_web_form_prefilled
    web_form_page.submit
    assert(BasicWebFormConfirmationPage.new(@driver)
               .get_confirmation_message_displayed)
  end

  # Negative test case for checking required fields validation.
  # Having filled in all question/information fields, going back and
  # clearing Name field which is required (including 'press Enter' action), test verifies that
  # validation error message for the Name field appears and that form cannot be
  # submitted.
  def test_required_fields_missing
    web_form_page = get_web_form_prefilled
    web_form_page.clear_name
    assert(web_form_page.get_name_field_missing_error_message_displayed)
    web_form_page.submit
    assert(web_form_page.get_web_form_displayed) #verifies remaining on the web form
    # ideally, after clicking submit button, it would be useful also to check/assert whether
    # validation error message is still being displayed. But since there seem to be bug
    # in validation itself(because even when peforming those steps manually, after
    # clicking submit button,red highlighting for required field remains but error message
    # disappears for some reason, sometimes it appears on every second click, but sometimes
    # appears and disappears right in a way). That's why after clicking submit button
    # there is only a check whether submit wasn't successfully process and user remains
    # on the current form.
  end

  def get_web_form_prefilled
    web_form_page = BasicWebFormPage.new(@driver)
    enter_all_web_form_information(web_form_page)
    web_form_page
  end


  def enter_all_web_form_information(web_form_page)
    web_form_page.enter_name
    web_form_page.check_enjoy_development
    web_form_page.select_testing_framework
    web_form_page.enter_comments
  end

  end
