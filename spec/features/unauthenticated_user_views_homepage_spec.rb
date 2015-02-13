require 'rails_helper'

feature 'unauthenticated user views home page' do
  scenario 'can browse all items' do
    item1 = create(:item, title: 'Deviled Eggs', description: 'Eggs from Chicken', price: 10.0)
    item2 = create(:item, title:  'Interstate Mac and Cheese', description: 'Goat Cheese', price: 20.0)
    visit root_path
    within('ul.items') do
      within("li##{item1.id}") do
        expect(page).to have_css 'span.title', text: 'Deviled Eggs'
        expect(page).to have_css 'span.description', text: 'Eggs from Chicken'
        expect(page).to have_css 'span.price', text: '10.0'
        within('span.buy_button') do
          expect(page).to have_button 'Add to Cart'
        end
      end
      within("li##{item2.id}") do
        expect(page).to have_css 'span.title', text: 'Interstate Mac and Cheese'
        expect(page).to have_css 'span.description', text: 'Goat Cheese'
        expect(page).to have_css 'span.price', text: '20.0'
        within('span.buy_button') do
          expect(page).to have_button 'Add to Cart'
        end
      end
    end
  end

  scenario 'can see all the categories' do
    create(:category, title: 'Kitchen')
    create(:category, title: 'Men')
    visit root_path
    expect(page).to have_link 'Kitchen'
    expect(page).to have_link 'Men'
  end

  scenario 'can click on a category and view the items' do
    category = create(:category, title: 'Bathroom')
    item1 = create(:item, title: 'Plate')
    category.items << item1
    item2 = create(:item, title: 'Kadaai')
    category.items << item2
    visit root_path
    click_link 'Bathroom'
    expect(page).to have_css 'ul.items li.title', text: 'Plate'
    expect(page).to have_css 'ul.items li.title', text: 'Kadaai'
  end

  scenario 'can add an item to his cart' do
    item = create(:item, title: 'Deviled Eggs', description: 'Eggs from Chicken', price: 10.0)
    visit root_path
    within("li##{item.id}") do
      click_button 'Add to Cart'
    end
    expect(page).to have_text 'Line item was successfully created.'
    expect(page).to have_text 'You have 1 items in your cart'
  end

  scenario 'cannot Checkout (until they log in)' do
  end

  scenario 'cannot View another user’s private data (such as current order, etc.)' do
    item = create(:item, title: 'Deviled Eggs', description: 'Eggs from Chicken', price: 10.0)
    user1 = create(:user)
    sign_in_as user1
    within("li##{item.id}") do
      click_button 'Add to Cart'
    end
    click_link 'Logout'
    click_link 'My Cart'
    expect(page).to have_text 'You have 0 items in your cart'
    user2 = create(:user)
    sign_in_as user2
    within("li##{item.id}") do
      click_button 'Add to Cart'
    end
    click_link 'My Cart'
    expect(page).to have_text 'You have 1 items in your cart'
  end
end
