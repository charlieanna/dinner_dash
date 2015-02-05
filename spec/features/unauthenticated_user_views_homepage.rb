require 'rails_helper'

feature 'unauthenticated user views home page' do
  scenario "can browse all items" do
  	FactoryGirl.create(:item, title: 'Deviled Eggs', description: 'Eggs from Chicken', price: 10.0)
  	FactoryGirl.create(:item, title:  'Interstate Mac and Cheese', description: 'Goat Cheese', price: 20.0)
    visit root_path
    expect(page).to have_css 'ul.items li.title', text: 'Deviled Eggs'
    expect(page).to have_css 'ul.items li.description', text: 'Eggs from Chicken'
    expect(page).to have_css 'ul.items li.price', text: '10.0'
    expect(page).to have_css 'ul.items li.title', text: 'Interstate Mac and Cheese'
    expect(page).to have_css 'ul.items li.description', text: 'Goat Cheese'
    expect(page).to have_css 'ul.items li.price', text: '20.0'
  end

  scenario 'can see all the categories' do
    FactoryGirl.create(:category, title: "Kitchen")
    FactoryGirl.create(:category, title: "Men")
    visit root_path
    expect(page).to have_link 'Kitchen'
    expect(page).to have_link 'Men'
  end

  scenario 'can click on a category and view the items' do

    category = FactoryGirl.create(:category, title: "Kitchen")
    item1 = FactoryGirl.create(:item, title: 'Plate', category: category)
  	item2 = FactoryGirl.create(:item, title: 'Kadaai', category: category)
    visit root_path
    click_link 'Kitchen'
    expect(page).to have_css 'ul.items li.title', text: 'Plate'
    expect(page).to have_css 'ul.items li.title', text: 'Kadaai'
  end
end