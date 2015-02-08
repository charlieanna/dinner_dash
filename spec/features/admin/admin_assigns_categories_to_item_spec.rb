require 'rails_helper'

feature 'Admin assigns category to item' do
	scenario 'adds category' do
    item = create(:item)
    admin = create(:admin_user)
    category = create(:category)
    sign_in_as admin
    visit edit_item_path(item)
    select(category.title, :from => 'category')
	end
	scenario 'removes category' do

    admin = create(:admin_user)
    category = create(:category)
    item = create(:item, category: category)
    sign_in_as admin
    visit edit_item_path(item)
	end
end