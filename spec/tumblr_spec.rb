require 'spec_helper'
require 'watir-webdriver'

describe "http://tumblr.com/login should" do

let(:browser){@browser ||=  Watir::Browser.new :firefox} 
before{browser.goto 'http://tumblr.com/login'}
after{browser.close}

  it "be able to enter email credentials" do
  browser.text_field(id: "signup_email").set("jefah@hotmail.com")
  browser.button(:id => 'signup_forms_submit')
  browser.click
  
  end

end

