require 'rails_helper'

feature 'Admin archives an item' do
	scenario 'Non admin users cannot see archived items' do
		create(:item, state: "archived")
		visit root_path
		expect(page).not_to have_button 'Add to Cart'
	end

	scenario 'Admins can archive an item' do
		create(:item)
    admin_user = create(:admin_user)
    sign_in_as admin_user
    visit items_path
    click_link 'Archive'
    expect(page).to have_text 'Item has been archived'
	end
end