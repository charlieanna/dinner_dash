require 'rails_helper'

feature 'User sees reviews of items' do
	scenario 'sees title, body and the stars and also the name of the person who reviwed it' do 
	  review = create(:review)
	  visit root_path
	  within 'li#1' do
	    click_link 'Reviews'
	  end	
	  expect(page).to have_css '.reviews', text: 'Reviews'
	  expect(page).to have_css 'li#1 .reviewer', text: "Reviewed by ankur"
	  expect(page).to have_css 'li#1 .title', text: "title1"
	  expect(page).to have_css 'li#1 .body', text: "body1"
	  expect(page).to have_css 'li#1 .stars', text: "Stars: 0"
	end
end