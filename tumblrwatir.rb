#$LOAD_PATH<<'.' allows user to provide modules
require 'watir'
require 'yaml'
require './tumblr_module.rb'

browser = Watir::Browser.start 'http://tumblr.com/login'

include Login
Login.credentials(browser)
Login.make_post(browser)
Login.verification(browser)

browser.quit

