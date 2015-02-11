require 'rails_helper'

feature 'User sees reviews of items' do
	scenario 'sees title, body and the stars and also the name of the person who reviwed it' do 
	  item = create(:item)
	  visit root_path
	  within 'li#1' do
	    click_link 'Reviews'
	  end	
	  expect(page).to have_css '.reviews', text: 'Reviews'
	end
end