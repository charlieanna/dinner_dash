require 'rails_helper'

feature 'user can write a review for an item' do
  scenario 'only if he has purchased the item' do
  	order = create(:order, status: 'completed')
    line_items = create_list(:line_item, 1)
    order.line_items << line_items
    sign_in_as order.user
    visit root_path
    expect(page).to have_link 'Write a review'
  end
end
