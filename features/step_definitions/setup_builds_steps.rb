Given(/^I am signed up$/) do
  visit root_url
  click_link 'Sign Up'
  fill_in 'Email', with: 'bob@example.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Sign up'
end

When(/^I create my "(.*?)" app$/) do |my_application_name|
  @my_application_name = my_application_name
  visit apps_path
  click_link 'New App'
  fill_in 'Name', with: @my_application_name
  click_button 'Create App'
end

Then(/^my application should be present$/) do
  find('.js-applications').should have_content(@my_application_name)
end
