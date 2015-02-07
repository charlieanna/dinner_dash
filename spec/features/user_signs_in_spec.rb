require 'rails_helper'

feature 'user signs in' do
	scenario 'with email and password' do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:item, title: 'Deviled Eggs', description: 'Eggs from Chicken', price: 10.0)
    sign_in_as user
    expect(page).not_to have_link 'Login'
    expect(page).to have_link 'Logout'
    expect(page).to have_css '.current_user', text: "Signed in as #{user.email}"
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
    FactoryGirl.create(:item, title: 'Deviled Eggs', description: 'Eggs from Chicken', price: 10.0)
	  sign_in
    click_link 'Logout'
    expect(page).to have_button 'Login'
    expect(page).to have_text 'Signed out successfully'
	end

  scenario 'does not clear the cart' do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:item, title: 'Deviled Eggs', description: 'Eggs from Chicken', price: 10.0)
    visit root_path
    within('ul.items li#1') do
      click_button 'Add to Cart'
    end
    expect(page).to have_text 'You have 1 items in your cart'

    sign_in_as user
    click_link "My Cart"

    expect(page).to have_text 'You have 1 items in your cart'
  end
end