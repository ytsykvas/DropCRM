Given(/^We have a logged in user. It is (.*?)$/) do |user_type|
  visit new_user_registration_path
  find("[data-test-id='email-input']").fill_in(with: Faker::Internet.email)
  find("[data-test-id='password-input']").fill_in(with: 'blink182')
  find("[data-test-id='password_confirmation-input']").fill_in(with: 'blink182')
  find("[data-test-id='company-name-input']").fill_in(with: 'Company Name')
  if user_type == 'supplier'
    find("[data-test-id='user-type-input']").select("Надаю товари продавцям")
  elsif user_type == 'buyer'
    find("[data-test-id='user-type-input']").select("Продаю в роздріб")
  end
  find('input[type="submit"]').click
  visit current_url
end

# Given(/^We have a user. It is (.*?)$/) do |user_type|
#   @user = FactoryBot.create(:user, user_type:)
# end
