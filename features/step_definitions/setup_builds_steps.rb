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
  visit applications_path
  click_link 'Create new app'
  fill_in 'Name', with: @my_application_name
  click_button 'Create app'
end

Then(/^my application should be present$/) do
  find('.js-applications').should have_content(@my_application_name)
end
