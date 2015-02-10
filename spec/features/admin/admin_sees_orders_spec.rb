require 'rails_helper'

feature 'Admin sees orders' do
	scenario 'along with their status' do
		# line_items = create_list(:line_item, 15)
		order1 = create(:order, status: "paid")
    order2 = create(:order, status: "completed")
    order3 = create(:order, status: "cancelled")
    order4 = create(:order, status: "ordered")
		# order.line_items << line_items
		admin = create(:admin_user)
		sign_in_as admin
		visit orders_path
		expect(page).to have_text 'ordered'
		expect(page).to have_text 'paid'
		expect(page).to have_text 'completed'
		expect(page).to have_text 'cancelled'
	end

	scenario 'can change the status of the orders(link to "cancel" individual orders which are currently "ordered" or "paid")' do
		order1 = create(:order, status: "paid")
    admin = create(:admin_user)
		sign_in_as admin
		visit orders_path
    click_link 'Cancel'
    expect(page).to have_text 'cancelled'
	end

	scenario 'can change the status of the orders(link to "cancel" individual orders which are currently "ordered" or "paid")' do
		order1 = create(:order, status: "ordered")
    admin = create(:admin_user)
		sign_in_as admin
		visit orders_path
    click_link 'Cancel'
    expect(page).to have_text 'cancelled'
	end

	scenario 'should not see a cancel link if the order is already cancelled or completed' do
		order1 = create(:order, status: "completed")
    admin = create(:admin_user)
		sign_in_as admin
		visit orders_path
    expect(page).not_to have_link 'Cancel'
	end

	# scenario 'can see a particular order by clicking on their link'
	# scenario 'filter orders to display by status type (for statuses "ordered", "paid", "cancelled", "completed")'

	# context 'link to transition to a different status:' do
 #    scenario 'link to "cancel" individual orders which are currently "ordered" or "paid"'
 #    scenario 'link to "mark as paid" orders which are "ordered"'
 #    scenario 'link to "mark as completed" individual orders which are currently "paid"'
	# end
end