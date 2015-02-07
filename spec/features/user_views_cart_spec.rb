require 'rails_helper'

feature 'User views cart' do
	scenario 'sees all the items he has added' do
		user = FactoryGirl.create(:user)
		sign_in_as user
		click_link 'My Cart'
    expect(page).to have_text "You have 0 items in your cart"
	end

	scenario "can remove item from his cart" do
		user = FactoryGirl.create(:user)
		item = FactoryGirl.create(:item)
		cart = FactoryGirl.create(:cart, user: user)
		line_item = FactoryGirl.create(:line_item, cart: cart, item: item)
		sign_in_as user
		click_link 'My Cart'
		click_link "Remove"
		expect(page).to have_text "0 items"
    expect(page).to have_text "Item has been successfully removed"
	end
end