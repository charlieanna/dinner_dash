require 'rails_helper'

feature 'user searches for item' do
  scenario 'using title or description. It searches all the items on title and description' do
    item = create(:item, title: "Dairy", description: "Office dairy", price: 1)
    create(:item, title: "Toilet paper", description: "for wiping ur butt", price: 2)
    visit root_path
    fill_in 'Search',with: 'Dairy'
    click_button 'Search'
    expect(page).to have_css  "ul.results li##{item.id}.item .title", text: "Dairy"
    expect(page).to have_css  "ul.results li##{item.id}.item .description", text: "Office dairy"
    expect(page).to have_css  "ul.results li##{item.id}.item .price",text: "1"

    expect(page).not_to have_text 'Toilet paper'
  end

  scenario 'on the orders page' do
  	item = create(:item, title: "Dairy", description: "Office dairy", price: 1)
    order = create(:order, status: "completed")
    line_items = create_list(:line_item, 5)
    order.line_items << line_items
    sign_in_as order.user
    visit orders_path
    save_and_open_page
    fill_in 'search',with: "title1"
    click_button 'Search'
    expect(page).to have_css  "ul.results li##{item.id}.item .title", text: "Dairy"
    expect(page).to have_css  "ul.results li##{item.id}.item .description", text: "Office dairy"
    expect(page).to have_css  "ul.results li##{item.id}.item .price",text: "1"

    expect(page).not_to have_text 'Dairy'
  end
end
