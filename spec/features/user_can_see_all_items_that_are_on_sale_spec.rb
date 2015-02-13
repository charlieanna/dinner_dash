require 'rails_helper'

feature 'User can see all the items and categories on sale' do
  scenario 'items and cateogories which are on sale' do
    sale = create(:sale, name: "Diwali Bonanza", discount: 20.0)
    create(:item, title: 'Diary', price: 10, sale: sale)
    visit root_path
    click_link 'Sales'
    expect(page).to have_css '.sale_items .item .title', text: 'Diary'
    expect(page).to have_css '.sale_items .item .actual_price', text: '10'
    expect(page).to have_css '.sale_items .item .sale_price', text: '8'
    expect(page).to have_css '.sale_items .item .percent_discount', text: '20.0%'
  end
end
