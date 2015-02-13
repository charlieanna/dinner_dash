require 'rails_helper'

feature 'User sees reviews of items' do
  scenario 'sees title, body and the stars and also the name of the person who reviwed it' do
    review = create(:review)
    visit root_path
    within "li##{review.item.id}" do
      click_link 'Reviews'
    end
    expect(page).to have_css '.reviews', text: 'Reviews'
    expect(page).to have_css "li##{review.id} .reviewer", text: 'Reviewed by ankur'
    expect(page).to have_css "li##{review.id} .title", text: 'title1'
    expect(page).to have_css "li##{review.id} .body", text: 'body1'
    expect(page).to have_css "li##{review.id} .stars", text: 'Stars: 0'
  end
end
