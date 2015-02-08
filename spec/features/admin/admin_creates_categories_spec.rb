require 'rails_helper'

feature 'admin creates categories for items' do
	scenario 'with name' do
		admin = create(:admin_user)
		sign_in_as admin
		visit new_category_path
		fill_in "Title", with: "Small Plates"
		click_button 'Create'
		expect(page).to have_text 'Category has been created'
	end
end