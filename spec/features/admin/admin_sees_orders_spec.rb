require 'rails_helper'

feature 'Admin sees orders' do
	scenario 'along with their status' do
	end

	scenario 'can see a particular order by clicking on their link'
	scenario 'filter orders to display by status type (for statuses "ordered", "paid", "cancelled", "completed")'

	context 'link to transition to a different status:' do
    scenario 'link to "cancel" individual orders which are currently "ordered" or "paid"'
    scenario 'link to "mark as paid" orders which are "ordered"'
    scenario 'link to "mark as completed" individual orders which are currently "paid"'
	end
end