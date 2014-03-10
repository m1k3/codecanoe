Given(/^I am signed up$/) do
  visit root_url
  click_link 'Sign Up'
  fill_in :email, with: 'bob@example.com'
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'password'
  click_button 'Submit'
end

When(/^I create my "(.*?)" app$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^my application should be present$/) do
  pending # express the regexp above with the code you wish you had
end
