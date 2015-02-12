require 'rails_helper'

feature 'user cannot review an unpurchased item' do
	scenario 'unauthenticated cannot see the write a review link' do
		create(:item)
		user = create(:user)
		visit root_path
		# expect(page).not_to have_link "Write a review"
	end

	scenario 'Signed user cannot write a review to an item which he not yet been completed' do
		user = create(:user)
    order = create(:order, user: user, status: 'paid')
    ap user.orders
    line_items = create_list(:line_item, 1)
    order.line_items << line_items
    sign_in_as user
    # expect(page).not_to have_link 'Write a review'
	end
end