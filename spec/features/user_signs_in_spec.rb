require 'rails_helper'

feature 'user signs in' do
	scenario 'with email and password' do
    user = create(:user)
    create(:item, title: 'Deviled Eggs', description: 'Eggs from Chicken', price: 10.0)
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
    create(:user)
    create(:item, title: 'Deviled Eggs', description: 'Eggs from Chicken', price: 10.0)
	  sign_in
    click_link 'Logout'
    expect(page).to have_button 'Login'
    expect(page).to have_text 'Signed out successfully'
	end

  scenario 'does not clear the cart' do
    user = create(:user)
    item = create(:item, title: 'Deviled Eggs', description: 'Eggs from Chicken', price: 10.0)
    visit root_path
    within("ul.items li##{item.id}") do
      click_button 'Add to Cart'
    end
    expect(page).to have_text 'You have 1 items in your cart'

    sign_in_as user
    click_link "My Cart"

    expect(page).to have_text 'You have 1 items in your cart'
  end

  scenario 'can see past orders with links and who created the order' do
    user = create(:user)
    item = create(:item)
    cart = create(:cart, user: user)
    line_item = create(:line_item, cart: cart, item: item)
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
    visit orders_path
    expect(page).to have_text user.email
    expect(page).to have_link "Ankur"
  end
end