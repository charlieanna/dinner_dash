require 'rails_helper'

feature 'user writes a review' do
  scenario 'for an item he has purchased' do
    order = create(:order, status: 'completed')
    line_items = create_list(:line_item, 1)
    order.line_items << line_items
    sign_in_as order.user
    visit root_path
    click_link 'Write a review'
    fill_in 'Title', with: "Title"
    fill_in 'Body', with: "Body"
    fill_in 'Stars',with: 3
    click_button 'Submit'
    expect(page).to have_css 'ul.reviews li#1.review .body', text: 'Body'
    expect(page).to have_css 'ul.reviews li#1.review .title', text: 'Title'
    expect(page).to have_css 'ul.reviews li#1.review .stars', text: '3'
  end
end
