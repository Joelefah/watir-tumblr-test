module Login
  def credentials(browser)
    file = YAML.load_file('./login-details.yml')
    browser.text_field(id: 'signup_email').set file['credentials'][0]['email']
    browser.text_field(id: 'signup_password').set file['credentials'][1]['password']
    loginbttn = browser.button(id: 'signup_forms_submit')
    loginbttn.click   
  end
end
