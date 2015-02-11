require 'rails_helper'

describe Order, "#total_amount" do
	it 'finds the total amount of all the line items' do
    order = create(:order)
    line_items = create_list(:line_item, 15)
    order.line_items << line_items
    expect(order.total_amount).to eq 120
	end
end