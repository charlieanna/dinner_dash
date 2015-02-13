require 'rails_helper'

feature 'Admin assigns item to categories.' do
  # scenario 'adds one more category' do
  #    item = create(:item)
  #    admin = create(:admin_user)
  #    category = create(:category, title: "Wellness")
  #    sign_in_as admin
  #    visit edit_item_path(item)
  #    check("Wellness")
  #    click_button "Update"
  #    expect(page).to have_text 'Item has been updated'
  # end
  scenario 'removes category' do
    item = create(:item)
    admin = create(:admin_user)
    sign_in_as admin
    visit edit_item_path(item)
    uncheck('Kitchen')
    click_button 'Update'
    expect(page).to have_text 'Item has been updated'
  end
end
