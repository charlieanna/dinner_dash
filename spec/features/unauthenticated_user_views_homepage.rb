require 'rails_helper'

feature 'unauthenticated user views home page' do
  scenario "can browse all items" do
  	FactoryGirl.create(:item, title: 'Deviled Eggs', description: 'Eggs from Chicken', price: 10.0)
  	FactoryGirl.create(:item, title:  'Interstate Mac and Cheese', description: 'Goat Cheese', price: 20.0)
    visit root_path
    within('ul.items') do
    	within('li#1') do
		    expect(page).to have_css 'span.title', text: 'Deviled Eggs'
		    expect(page).to have_css 'span.description', text: 'Eggs from Chicken'
		    expect(page).to have_css 'span.price', text: '10.0'
		    within('span.buy_button') do
		       expect(page).to have_link 'Add to Cart'
		    end
	    end
	    within('li#2') do
		    expect(page).to have_css 'span.title', text: 'Interstate Mac and Cheese'
		    expect(page).to have_css 'span.description', text: 'Goat Cheese'
		    expect(page).to have_css 'span.price', text: '20.0'
		    within('span.buy_button') do
		       expect(page).to have_link 'Add to Cart'
		    end
		  end
    end
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

  scenario 'can add an item to his cart' do
    FactoryGirl.create(:item, title: 'Deviled Eggs', description: 'Eggs from Chicken', price: 10.0)
    visit root_path
    within('ul.items li#1') do
       click_link 'Add to Cart'
    end
    expect(page).to have_css '.cart', text: '1 item'
  end
end