require 'rails_helper'

feature 'user_can_increase_the_quantity_of_item' do
  scenario 'by increasing it by clicking on add to cart' do
  	user = FactoryGirl.create(:user)
  	item = FactoryGirl.create(:item)
		sign_in_as user
		visit root_path
		click_button 'Add to Cart'
		expect(page).to have_text '1 × Milk'
		visit root_path
		click_button 'Add to Cart'
		expect(page).to have_text '2 × Milk'
  end

  scenario 'by increasing the number of items' do
  	user = FactoryGirl.create(:user)
  	item = FactoryGirl.create(:item)
		sign_in_as user
		visit root_path
		click_button 'Add to Cart'
		expect(page).to have_text '1 × Milk'
		click_link "1"
	  fill_in "line_item_quantity", with: "3"
		click_button "Update"
		expect(page).to have_text '3 × Milk'
 end
end