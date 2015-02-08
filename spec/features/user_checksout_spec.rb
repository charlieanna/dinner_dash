require 'rails_helper'

feature 'User checkouts his cart' do
	scenario 'the cart status changes to ordered' do
    user = FactoryGirl.create(:user)
		item = FactoryGirl.create(:item)
		cart = FactoryGirl.create(:cart, user: user)
		line_item = FactoryGirl.create(:line_item, cart: cart, item: item)
		sign_in_as user
		visit root_path
		click_button 'Add to Cart'
		click_link 'My Cart'
		click_button 'Checkout'
		fill_in 'Name',with: "Ankur"
		fill_in 'Address', with: "Bangalore"
		fill_in 'Email', with: "ankothari@gmail.com"
		select 'Check', from: 'order_pay_type'
		click_button 'Place Order'
		expect(page).to have_text 'Thank you for your order'

	end
end