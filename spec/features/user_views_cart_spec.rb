require 'rails_helper'

feature 'User views cart' do
	scenario 'sees all the items he has added' do
		user = FactoryGirl.create(:user)
		sign_in_as user
		click_link 'My Cart'
    expect(page).to have_text "You have 0 items in your cart"
	end
end