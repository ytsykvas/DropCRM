When(/I visit (.*?) page/) do |page|
  path = case page
         when 'sign up'
           new_user_registration_path
         when 'log in'
           new_user_session_path
         when 'main'
           root_path
         end
  visit path
end

When(/I fill "(.*?)" in the (.*?) (field|select box)/) do |text, field_test_id, type|
  hash_of_data_test_id = {
    # Devise
    email: 'email-input',
    password: 'password-input',
    'password confirmation': 'password_confirmation-input',
    'user type': 'user-type-input',
    'company name': 'company-name-input'
  }.stringify_keys

  input_element = find("[data-test-id='#{hash_of_data_test_id[field_test_id.downcase]}']")
  if type == 'field'
    input_element.fill_in(with: text)
  elsif type == 'select box'
    input_element.select(text)
  end
end

When (/I click on the (.*?) (link|button)/) do |test_id, type|
  link_test_id = {
    # dashboard
  }
  button_test_id = {
    'submit': 'submit_button',
    # dashboard
    'avatar': 'avatar_picture',
    'sign out': 'log_out_button'
  }.stringify_keys
  object = case type
           when "link"
             link_test_id[test_id.downcase]
           when "button"
             button_test_id["#{test_id.downcase}"]
           else
             "unknown test id"
           end
  find("[data-test-id='#{object}']").click
end

When(/^I submit the form$/) do
  find('input[type="submit"]').click
end
