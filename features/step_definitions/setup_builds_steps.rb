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
  visit root_url
  click_link 'Go to my applications'
end

When(/^I open my app$/) do
  visit app_path(@my_application)
end


Then(/^someone elses application should not be present$/) do
  find('.js-applications').should have_no_content(@other_application_name)
end


When(/^I add a build configuration to my application$/) do
  step %{I open my apps}
  click_link 'Show'
  click_link 'New Configuration'
  @my_build_configuration_name = 'default'
  fill_in 'Name', with: @my_build_configuration_name
  fill_in 'Commands', with: 'bundle exec rake'
  click_button 'Create Build configuration'
end

Then(/^my build configuration should be visible on my app page$/) do
  step %{I open my app}
  page.should have_content(@my_build_configuration_name)
end


Given(/^my "(.*?)" app with a "(.*?)" build configuration was created$/) do |arg1, arg2|
  step %{my "facebook killer" app was created}
  @my_build_configuration = create(:build_configuration, app: @my_application)
end

When(/^I edit my build configuration$/) do
  step %{I open my app}
  click_link @my_build_configuration.name
  @my_build_configuration_name = 'standard'
  fill_in 'Name', with: @my_build_configuration_name
  click_button 'Update Build configuration'
end

When(/^I delete my build configuration$/) do
  visit app_path(@my_application)
  click_link 'Remove'
end

Then(/^my build configuration should not be visible on my app page$/) do
  puts BuildConfiguration.all.inspect
  visit app_path(@my_application)
  page.should have_no_content(@my_build_configuration.name)
end


When(/^I run my build of my application$/) do
  step %{I open my apps}
  click_link 'Run builds'
end

Then(/^I should see my build running$/) do
  step %{I open my apps}
  page.should have_content("#{@my_build_configuration.name} is currently running")
end
