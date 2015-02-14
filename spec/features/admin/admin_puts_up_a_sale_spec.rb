require 'rails_helper'

feature 'admin puts up a sale' do
  scenario 'Create a "sale" and connect it with individual items or entire categories' do
    admin = create(:admin_user)
    create(:category, title: 'Kitchen')
    create(:category, title: 'Diary')
    sign_in_as admin
    click_link 'Sales'
    click_link 'New Sale'
    fill_in 'Name', with: 'Diwali Bonanza'
    fill_in 'Discount', with: '10'
    check 'Kitchen'
    check 'Diary'
    click_button 'Create Sale'
    expect(page).to have_css '.category_percent_discount', text: 'Discount: Kitchen'
    expect(page).to have_css '.category_percent_discount', text: 'Discount: Diary'
    # expect(page).to have_text 'Sale has been created.'
    # expect(page).to have_css 'sale_price', text: 'Sale price: '
    # expect(page).to have_css 'percent_saved', text: 'Discount" '
  end
end
