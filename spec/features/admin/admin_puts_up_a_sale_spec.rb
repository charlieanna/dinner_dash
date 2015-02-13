require 'rails_helper'

feature 'admin puts up a sale' do
  scenario 'Create a "sale" and connect it with individual items or entire categories' do
    admin = create(:admin_user)
    sign_in_as admin
    click_button 'Sales'
    click_button 'New Sale'
    fill_in 'Name', with: 'Diwali Bonanza'
    fill_in 'Discount', with: '10'
    check 'Kitchen'
    check 'Diary'
    click_button 'Create Sale'
    expect(page).to have_text 'Sale has been created.'
    expect(page).to have_css 'sale_price', text: 'Sale price'
    expect(page).to have_css 'percent_saved', text: 'Discount Percentage'
  end
end
