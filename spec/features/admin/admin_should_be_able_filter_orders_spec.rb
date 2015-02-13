require 'rails_helper'

feature 'Admin filters the orders based on status' do
  scenario 'using a dropdown button' do
    create(:order, status: 'ordered')
    create(:order, status: 'paid')
    admin = create(:admin_user)
    sign_in_as admin
    visit orders_path
    select 'paid', from: 'status'
    click_button 'Filter'
    within 'ul' do
      expect(page).to have_text 'paid'
      expect(page).not_to have_text 'ordered'
    end
  end
end
