Then ('I click submit') do
  all('[type="submit"]').last.click
end

Then (/(After waiting max (\d*) seconds )?I (should see|should not see) the text: (.*)/) do |wait, see_or_not, key|
  hash_of_i18n_keys = {
    # Devise
    'sign up title': 'devise.registrations.new.title',
    'email field label': 'devise.registrations.new.email',
    'password field label': 'devise.registrations.new.password_confirmation',
    'success registration alert': 'devise.registrations.signed_up',
    'signed in alert': 'devise.sessions.signed_in',
    'forgot password': 'devise.shared_links.forgot_password',
    'Signed out': 'devise.sessions.already_signed_out',
    # navbar
    'main page': 'header.home',
    'prices page': 'header.prices',
    'contacts page': 'header.contacts',
    'log in': 'header.log_in',
    'log out': 'header.log_out',
    # toolbar
    'messages': 'toolbar.messages',
    'staff': 'toolbar.my_staff',
    'cart': 'toolbar.cart',
    'orders': 'toolbar.orders',
    'buyers': 'toolbar.buyers',
    'suppliers': 'toolbar.suppliers',
    'statistic': 'toolbar.statistic',
    'payouts': 'toolbar.payout',
    'wallet': 'toolbar.wallet',
    'advertisement': 'toolbar.advertisement',
    'help': 'toolbar.help',
    'settings': 'toolbar.settings'
  }.stringify_keys
  text = I18n.t(hash_of_i18n_keys.fetch(key))
  wait ||= Capybara.default_max_wait_time
  if see_or_not == 'should see'
    expect(page).to have_content text, wait: wait.to_i
  else
    expect(page).to_not have_content text, wait: wait.to_i
  end
end

Then(/^I see text: (.+)/) do |text|
  expect(page).to have_text(text)
end

Then('I confirm alert') do
  page.driver.browser.switch_to.alert.accept
end

Then(/^I (should|should not) see pagination$/) do |should_or_not|
  if should_or_not == 'should'
    expect(page).to have_selector('.pagination')
  else
    expect(page).not_to have_selector('.pagination')
  end
end
