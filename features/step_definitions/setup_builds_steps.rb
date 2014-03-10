Given(/^I am signed up$/) do
  visit root_url
  click_link 'Sign Up'
  user_attributes = attributes_for(:user)
  fill_in 'Email', with: user_attributes[:email]
  fill_in 'Password', with: user_attributes[:password]
  fill_in 'Password confirmation', with: user_attributes[:password]
  click_button 'Sign up'
end

When(/^I create my "(.*?)" app$/) do |my_application_name|
  @my_application_name = my_application_name
  step %{I open my apps}
  click_link 'New App'
  fill_in 'Name', with: @my_application_name
  click_button 'Create App'
end

Then(/^my application should be present$/) do
  find('.js-applications').should have_content(@my_application_name)
end


Given(/^I am signed in$/) do
  @current_user = create(:user)
  visit root_url
  click_link 'Sign In'
  fill_in 'Email', with: @current_user.email
  fill_in 'Password', with: @current_user.password
  click_button 'Sign in'
end

Given(/^my "(.*?)" app was created$/) do |my_application_name|
  # switch this to factory_girl if it becomes more complicated
  @my_application = App.create(name: my_application_name, owner: @current_user)
  @my_application_name = @my_application.name
end

Given(/^someone else has a "(.*?)" app$/) do |other_application_name|
  # switch this to factory_girl if it becomes more complicated
  @other_application = App.create(name: other_application_name, owner: create(:user, :anna))
  @other_application_name = @other_application.name
end

When(/^I open my apps$/) do
  visit apps_path
end

Then(/^someone elses application should not be present$/) do
  find('.js-applications').should have_no_content(@other_application_name)
end
