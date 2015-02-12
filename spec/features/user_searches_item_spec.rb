require 'rails_helper'

feature 'user searches for item' do
	scenario 'using title or description. It searches all the items on title and description' do
		create(:item, title: "Dairy", description: "Office diary", price: 1)
		create(:item, title: "ankur", description: "kothari", price: 2)
		visit root_path
		fill_in 'Search',with: 'Dairy'
		click_button 'Search'
		expect(page).to have_css  '.ul#results li#1.item.title', text: 'Diary'
		expect(page).to have_css  '.ul#results li#1.item.description', text: 'Office diary'
		expect(page).to have_css  '.ul#results li#1.item.price',text: '1'
	end 
end