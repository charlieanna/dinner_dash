require 'rails_helper'

feature 'user searches for item' do
	scenario 'using title or description. It searches all the items on title and description' do
		create(:item, title: "Dairy", description: "Office dairy", price: 1)
		create(:item, title: "Toilet paper", description: "for wiping ur butt", price: 2)
		visit root_path
		fill_in 'Search',with: 'Dairy'
		click_button 'Search'
		expect(page).to have_css  'ul.results li#1.item .title', text: 'Dairy'
		expect(page).to have_css  'ul.results li#1.item .description', text: 'Office dairy'
		expect(page).to have_css  'ul.results li#1.item .price',text: '1'

		expect(page).not_to have_text 'Toilet paper'
	end 
end