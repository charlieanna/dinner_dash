require 'rails_helper'

feature 'user signs in' do
	scenario 'with email and password' do
    FactoryGirl.create(:user)
    visit root_path
    click_link 'Login'
    fill_in 'email', with: "person@example.com"
    fill_in 'password',with: "aaaaaa"
    click_button 'Login'
    expect(page).not_to have_link 'Login'
    expect(page).to have_link 'Logout'
    expect(page).to have_css '.current_user', text: "Signed in as person@example.com"
	end

	scenario 'wrong email and password' do
		visit root_path
    click_link 'Login'
    fill_in 'email', with: "person@example.com"
    fill_in 'password',with: "aaaaaa"
    click_button 'Login'
    expect(page).to have_text 'Email and password do not match, try again.'
	end

	scenario 'can sign out' do
    FactoryGirl.create(:user)
	  visit root_path
    click_link 'Login'
    fill_in 'email', with: "person@example.com"
    fill_in 'password',with: "aaaaaa"
    click_button 'Login'
    click_link 'Logout'
    expect(page).to have_button 'Login'
    expect(page).to have_text 'Signed out successfully'
	end

  scenario 'does not clear the cart' do
  end
end