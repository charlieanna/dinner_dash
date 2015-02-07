require 'rails_helper'

feature 'As an admin when I visit the items page' do
	scenario 'I can see all the items' do
		admin = create(:admin_user)
		item1 = create(:item)
		item2 = create(:item)
		item3 = create(:item)
		item4 = create(:item)
    sign_in_as admin
		visit items_path
		within('ul.items') do
      within('li#1') do
        expect(page).to have_css 'span.title', text: item1.title
        expect(page).to have_css 'span.description', text: item1.description
        expect(page).to have_css 'span.price', text: item1.price
        within('span.edit') do
          expect(page).to have_link 'Edit'
        end
      end
      within('li#2') do
        expect(page).to have_css 'span.title', text: item2.title
        expect(page).to have_css 'span.description', text: item2.description
        expect(page).to have_css 'span.price', text: item2.price
        within('span.edit') do
          expect(page).to have_link 'Edit'
        end
      end
      within('li#3') do
        expect(page).to have_css 'span.title', text: item3.title
        expect(page).to have_css 'span.description', text: item3.description
        expect(page).to have_css 'span.price', text: item3.price
        within('span.edit') do
          expect(page).to have_link 'Edit'
        end
      end
      within('li#4') do
        expect(page).to have_css 'span.title', text: item4.title
        expect(page).to have_css 'span.description', text: item4.description
        expect(page).to have_css 'span.price', text: item4.price
        within('span.edit') do
          expect(page).to have_link 'Edit'
        end
      end
    end
	end

  scenario "I can edit any item" do
    admin = create(:admin_user)
    item1 = create(:item)
    sign_in_as admin
    visit items_path
    click_link "Edit"
    fill_in "Title", with: "Title1"
    click_button "Update"
    expect(page).to have_text "Item has been updated"
  end

  scenario "I can create new items" do
    admin = create(:admin_user)
    sign_in_as admin
    visit new_item_path
    fill_in "Title", with: "Title"
    fill_in "Description",with: "description"
    fill_in "Price", with: "10"
    page.attach_file('Photo', '/Users/pradeepkothari/Dropbox/Apps/Hawkeye_ankur/1b_thumb.png')
    click_button "Create"
    expect(page).to have_text "A new item has been created."
  end
end