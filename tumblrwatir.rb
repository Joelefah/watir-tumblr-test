#$LOAD_PATH<<'.' allows user to provide modules
require 'watir'
require 'yaml'
require './login_module.rb'

browser = Watir::Browser.start 'http://tumblr.com/login'


include Login
Login.credentials(browser)

newpostbutton = browser.i class: 'icon_post_text'

newpostbutton.click

titlefield = browser.div(class: 'editor-plaintext').send_keys('Testpost title')
bodyfield = browser.div(class: 'editor-richtext')
bodyfield.click
bodyfield.send_keys('Does it post?')

createpost = browser.button(class: 'create_post_button')

createpost.click

verifyposttitle =  browser.div(class: 'post_title')
verifypostbody = browser.div(class: 'post_body')


if verifyposttitle.text.match /Testpost title/
	puts "post: found title post \'#{verifyposttitle.text}\'"
else
	puts "post: title post not found"
end

if verifypostbody.text.match /Does it post?/
	puts "post: found body post \'#{verifypostbody.text}\'"
else
	puts "post: body post not found"
end

browser.quit

