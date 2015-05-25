require_relative '../web_page'

# Class for a confirmation page that is being automatically loaded after successful
# submitting of the form on the basic web form page.
class BasicWebFormConfirmationPage < WebPage

  def initialize(driver)
    @driver = driver
  end

  def get_confirmation_message_displayed
    get_confirmation_message.displayed?
  end

  def get_confirmation_message
    get_page_element(:css, '.ss-resp-message')
    # another locator for the element might be the following xpath locator:
    # //h1[@class='ss-confirmation']/..//div[@class='ss-resp-message']
    # in case there will be other response messages in the future and we need to be sure
    # that we are looking at the confirmation response message (@class='ss-confirmation')
  end

end