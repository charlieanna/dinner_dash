require 'rails_helper'

feature 'user_can_increase_the_quantity_of_item' do
  scenario 'by increasing it by clicking on add to cart' do
    user = create(:user)
    item = create(:item)
    sign_in_as user
    visit root_path
    click_button 'Add to Cart'
    expect(page).to have_text "1 × #{item.title}"
    visit root_path
    click_button 'Add to Cart'
    expect(page).to have_text "2 × #{item.title}"
  end

  scenario 'by increasing the number of items' do
    user = create(:user)
    item = create(:item)
    sign_in_as user
    visit root_path
    click_button 'Add to Cart'
    click_link '1'
    fill_in 'line_item_quantity', with: '3'
    click_button 'Update'
    expect(page).to have_text "3 × #{item.title}"
  end
end
