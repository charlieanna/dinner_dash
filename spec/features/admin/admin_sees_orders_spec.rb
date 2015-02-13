require 'rails_helper'

feature 'Admin sees orders' do
  scenario 'along with their status' do
    # line_items = create_list(:line_item, 15)
    create(:order, status: 'paid')
    create(:order, status: 'completed')
    create(:order, status: 'cancelled')
    create(:order, status: 'ordered')
    # order.line_items << line_items
    admin = create(:admin_user)
    sign_in_as admin
    visit orders_path
    expect(page).to have_text 'ordered'
    expect(page).to have_text 'paid'
    expect(page).to have_text 'completed'
    expect(page).to have_text 'cancelled'
  end

  scenario 'can change the status of the orders(link to "cancel" individual orders which are currently "ordered" or "paid")' do
    order1 = create(:order, status: 'paid')
    admin = create(:admin_user)
    sign_in_as admin
    visit orders_path
    click_link 'Cancel'
    expect(page).to have_text 'cancelled'
  end

  scenario 'can change the status of the orders(link to "cancel" individual orders which are currently "ordered" or "paid")' do
    order1 = create(:order, status: 'ordered')
    admin = create(:admin_user)
    sign_in_as admin
    visit orders_path
    click_link 'Cancel'
    expect(page).to have_text 'cancelled'
  end

  scenario 'should not see a cancel link if the order is already cancelled or completed' do
    order1 = create(:order, status: 'completed')
    admin = create(:admin_user)
    sign_in_as admin
    visit orders_path
    expect(page).not_to have_link 'Cancel'
  end

  scenario 'can see a particular order by clicking on their link' do
    order = create(:order, status: 'ordered')

    admin = create(:admin_user)
    sign_in_as admin
    visit orders_path
    within 'ul'  do
      expect(page).to have_text order.created_at.strftime('%B %d %Y at %I:%M %p')
      expect(page).to have_text 'created by ankur ankothari@gmail.com'
    end
  end

  scenario 'can see the items details for a specific order' do
    order = create(:order, status: 'ordered')
    line_items = create_list(:line_item, 1)
    order.line_items << line_items
    admin = create(:admin_user)
    sign_in_as admin
    visit orders_path
    click_link 'Ankur Kothari'
    expect(page).to have_text line_items.first.item.title
    expect(page).to have_text line_items.first.item.description
    expect(page).to have_text line_items.first.quantity
  end
end
