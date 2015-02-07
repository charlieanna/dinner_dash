require 'rails_helper'

feature 'User signs up' do
	scenario 'with email, name and password' do
		visit root_path
		click_link "Signup"
	  fill_in "user_email",with: "person@example.com"
	  fill_in "user_password",with: "aaaaaa"
    fill_in "user_password_confirmation", with: "aaaaaa"
    click_button 'Signup'
    expect(page).to have_text 'You have successfully signed up'
    expect(page).to have_text 'Signed in as person@example.com'
	end
end